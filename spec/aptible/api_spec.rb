require 'spec_helper'
require 'aptible/auth'

describe Aptible::Api do
  subject { Aptible::Api::App.new }

  describe '#bearer_token' do
    it 'should accept an Aptible::Auth::Token' do
      token = Aptible::Auth::Token.new
      token.stub(:access_token) { 'aptible_auth_token' }
      subject.stub(:token) { token }
      expect(subject.bearer_token).to eq token.access_token
    end
  end

  it 'should have a configurable root_url' do
    config = described_class.configuration
    expect(config).to be_a GemConfig::Configuration
    expect(config.root_url).to eq 'https://api.aptible.com'
  end

  pending 'uses ENV["APTIBLE_API_ROOT_URL"] if defined' do
    config = described_class.configuration
    set_env 'APTIBLE_API_ROOT_URL', 'http://foobar.com' do
      config.reset
      expect(config.root_url).to eq 'http://foobar.com'
    end
  end
end
