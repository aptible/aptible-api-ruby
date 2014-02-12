require 'spec_helper'

describe Aptible::Api do
  it 'should have a configurable root_url' do
    config = described_class.configuration
    expect(config).to be_a GemConfig::Configuration
    expect(config.root_url).to eq 'https://api.aptible.com'
  end
end
