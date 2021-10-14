require 'aptible/auth'

module Aptible
  module Api
    class Operation < Resource
      belongs_to :resource
      belongs_to :account
      belongs_to :destination_account

      has_many :ssh_portal_connections
      has_many :ephemeral_sessions

      field :id
      field :type
      field :status
      field :cancelled
      field :aborted
      field :git_ref
      field :docker_ref
      field :certificate
      field :private_key
      field :env
      field :container_size
      field :container_count
      field :disk_size
      field :command
      field :destination_region
      field :interactive
      field :user_name
      field :user_email
      field :immediate
      field :stack_settings
      field :created_at, type: Time
      field :updated_at, type: Time
      field :instance_profile

      def user
        auth = Aptible::Auth::User.new(token: token, headers: headers)
        auth.find_by_url(links['user'].href)
      rescue StandardError
        nil
      end

      def succeeded?
        status == 'succeeded'
      end

      def failed?
        status == 'failed'
      end

      def with_ssh_cmd(private_key_file, host: nil, port: nil, host_key: nil)
        # We expect that the public key will be found next to the private key,
        # which is also what SSH itself expects. If that's not the case, then
        # we'll just fail. The Aptible CLI will always ensure credentials are
        # set up properly (other consumers are of course responsible for doing
        # the same!).
        public_key_file = "#{private_key_file}.pub"

        private_key = File.read(private_key_file)
        public_key = File.read(public_key_file)

        connection = create_ssh_portal_connection!(ssh_public_key: public_key)
        certificate = connection.ssh_certificate_body

        stack = account.stack
        host ||= stack.ssh_portal_host
        port ||= stack.ssh_portal_port
        host_key ||= stack.ssh_host_rsa_public_key

        with_temporary_known_hosts(
          host, port, host_key
        ) do |known_hosts_file|
          with_temporary_id(private_key, public_key, certificate) do |id_file|
            cmd = [
              'ssh',
              "#{connection.ssh_user}@#{host}",
              '-p', port.to_s,
              '-i', id_file,
              '-o', 'IdentitiesOnly=yes',
              '-o', "UserKnownHostsFile=#{known_hosts_file}",
              '-o', 'StrictHostKeyChecking=yes'
            ]

            # If we aren't allowed to create a pty, then we shouldn't try to
            # allocate once, or we'll get an awkward error.
            cmd << '-T' unless connection.ssh_pty

            yield cmd, connection
          end
        end
      end

      private

      def with_temporary_known_hosts(host, port, host_key)
        Dir.mktmpdir do |dir|
          known_hosts_file = File.join(dir, 'known_hosts')
          contents = "[#{host}]:#{port} #{host_key}\n"
          File.open(known_hosts_file, 'w', 0o600) { |f| f.write(contents) }
          yield known_hosts_file
        end
      end

      def with_temporary_id(private_key, public_key, certificate)
        # Most versions of OpenSSH don't support specifying the SSH certificate
        # to use when connecting, so we create a temporary directory with the
        # credentials and the certificate. From a security perspective, the CLI
        # makes sure to use an Aptible-CLI only SSH key to minimize exposure
        # should we fail to clean out the temporary directory.
        Dir.mktmpdir do |dir|
          private_key_file = File.join(dir, 'id_rsa')
          public_key_file = "#{private_key_file}.pub"
          certificate_file = "#{private_key_file}-cert.pub"

          pairs = [
            [private_key, private_key_file],
            [public_key, public_key_file],
            [certificate, certificate_file]
          ]

          pairs.each do |contents, file|
            File.open(file, 'w', 0o600) { |f| f.write(contents) }
          end

          yield private_key_file
        end
      end
    end
  end
end
