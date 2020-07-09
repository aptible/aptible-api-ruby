$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

# Load shared spec files
Dir["#{File.dirname(__FILE__)}/shared/**/*.rb"].each do |file|
  require file
end

# Require library up front
require 'aptible/api'

require 'rspec/its'

RSpec.configure do |config|
  config.before { Aptible::Api.configuration.reset }
end
