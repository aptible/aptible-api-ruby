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
end
