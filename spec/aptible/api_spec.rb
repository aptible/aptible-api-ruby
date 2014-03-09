require 'spec_helper'

describe Aptible::Api do
  describe '#initialize' do
    it 'should be a HyperResource instance' do
      expect(subject).to be_a HyperResource
    end
  end

  describe '#bearer_token' do
    it 'should accept an Aptible::Auth::Token' do
      token = Aptible::Auth::Token.new
      token.stub(:access_token) { 'abtible_auth_token' }
      subject.stub(:token) { token }
      expect(subject.bearer_token).to eq token.access_token
    end

    it 'should accept an Fridge::AccessToken' do
      token = Fridge::AccessToken.new
      token.stub(:to_s) { 'fridge_access_token' }
      subject.stub(:token) { token }
      expect(subject.bearer_token).to eq token.to_s
    end

    it 'should accept a String' do
      subject.stub(:token) { 'token' }
      expect(subject.bearer_token).to eq 'token'
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
