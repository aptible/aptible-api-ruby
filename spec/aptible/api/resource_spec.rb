require 'spec_helper'

describe Aptible::Api::Resource do
  its(:namespace) { should eq 'Aptible::Api' }
  its(:root_url) { should eq 'https://api.aptible.com' }
end
