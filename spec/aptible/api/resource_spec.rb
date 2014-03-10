require 'spec_helper'

describe Aptible::Api::Resource do
  describe '.collection_url' do
    it 'should use the pluralized resource name' do
      url = Aptible::Api::Disk.collection_url
      expect(url).to eq 'https://api.aptible.com/disks'
    end
  end

  describe '.find' do
    it 'should call find_by_url' do
      url = 'https://api.aptible.com/disks/42'
      expect(Aptible::Api::Disk).to receive(:find_by_url).with url
      Aptible::Api::Disk.find(42)
    end
  end

  describe '.all' do
    let(:app) { double Aptible::Api::App }
    let(:collection) { double Aptible::Api }

    before do
      collection.stub(:apps) { [app] }
      Aptible::Api::App.any_instance.stub(:find_by_url) { collection }
    end

    it 'should be an array' do
      expect(Aptible::Api::App.all).to be_a Array
    end

    it 'should return the root collection' do
      expect(Aptible::Api::App.all).to eq [app]
    end

    it 'should pass options to the HyperResource initializer' do
      klass = Aptible::Api::App
      options = { token: 'token' }
      expect(klass).to receive(:new).with(options).and_return klass.new
      Aptible::Api::App.all(options)
    end
  end
end
