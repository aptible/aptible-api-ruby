require 'spec_helper'

describe Aptible::Api::Operation do
  describe '#with_ssh_cmd' do
    shared_examples '#with_ssh_cmd examples' do
      let(:stack) do
        Aptible::Api::Account.new.tap do |account|
          account.stub(
            ssh_portal_host: 'foo-bastion.com',
            ssh_portal_port: 1022,
            ssh_host_rsa_public_key: 'some rsa key'
          )
        end
      end

      let(:account) do
        Aptible::Api::Account.new.tap do |account|
          account.stub(stack: stack)
        end
      end

      let(:ssh_portal_connection) do
        Aptible::Api::SshPortalConnection.new.tap do |connection|
          connection.stub(
            ssh_user: 'foo-user',
            ssh_certificate_body: 'some certificate',
            ssh_pty: ssh_pty
          )
        end
      end

      subject do
        described_class.new.tap do |operation|
          operation.stub(account: account)
        end
      end

      let!(:work_dir) { Dir.mktmpdir }
      after { FileUtils.remove_entry work_dir }

      let(:private_key_file) { File.join(work_dir, 'id_rsa') }
      let(:public_key_file) { "#{private_key_file}.pub" }

      before do
        File.open(private_key_file, 'w') { |f| f.write('some private key') }
        File.open(public_key_file, 'w') { |f| f.write('some public key') }
      end

      it 'yields usable SSH connection arguments' do
        expect(subject).to receive(:create_ssh_portal_connection!)
          .and_return(ssh_portal_connection)

        has_yielded = false

        subject.with_ssh_cmd(private_key_file) do |cmd, connection|
          _, dest, _, port, _, id_file, = cmd

          expect(dest).to eq('foo-user@foo-bastion.com')
          expect(port).to eq('1022')
          expect(File.read(id_file)).to eq('some private key')
          expect(File.read("#{id_file}.pub")).to eq('some public key')
          expect(File.read("#{id_file}-cert.pub")).to eq('some certificate')

          hosts_param = cmd.find { |p| p.start_with?('UserKnownHostsFile') }
          expect(cmd[cmd.index(hosts_param) - 1]).to eq('-o')
          expect(hosts_param).not_to be_nil
          hosts_file = hosts_param.split('=')[1]

          expect(File.read(hosts_file))
            .to eq("[foo-bastion.com]:1022 some rsa key\n")

          expect(File.readable?(id_file)).to be_truthy
          expect(File.writable?(id_file)).to be_truthy

          expect(File.world_readable?(id_file)).to be_falsey
          expect(File.world_writable?(id_file)).to be_falsey

          expect(connection).to be(ssh_portal_connection)

          if ssh_pty
            expect(cmd).not_to include('-T')
          else
            expect(cmd).to include('-T')
          end

          [
            'IdentitiesOnly=yes',
            'StrictHostKeyChecking=yes'
          ].each do |option|
            expect(cmd).to include(option)
            expect(cmd[cmd.index(option) - 1]).to eq('-o')
          end

          has_yielded = true
        end

        expect(has_yielded).to be_truthy
      end

      it 'allows passing a custom host' do
        expect(subject).to receive(:create_ssh_portal_connection!)
          .and_return(ssh_portal_connection)

        has_yielded = false

        subject.with_ssh_cmd(
          private_key_file,
          host: 'host-foo.com',
          port: 123,
          host_key: 'foo key'
        ) do |cmd, _|
          _, dest, _, port, = cmd

          expect(dest).to eq('foo-user@host-foo.com')
          expect(port).to eq('123')

          hosts_param = cmd.find { |p| p.start_with?('UserKnownHostsFile') }
          expect(cmd[cmd.index(hosts_param) - 1]).to eq('-o')
          expect(hosts_param).not_to be_nil
          hosts_file = hosts_param.split('=')[1]

          expect(File.read(hosts_file))
            .to eq("[host-foo.com]:123 foo key\n")

          has_yielded = true
        end

        expect(has_yielded).to be_truthy
      end
    end

    context 'with a PTY' do
      let(:ssh_pty) { true }
      include_examples '#with_ssh_cmd examples'
    end

    context 'without a PTY' do
      let(:ssh_pty) { false }
      include_examples '#with_ssh_cmd examples'
    end
  end
end
