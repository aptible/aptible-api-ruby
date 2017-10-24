require 'tmpdir'

require 'aptible/auth'
require 'gem_config'

module Aptible
  module Api
    include GemConfig::Base

    with_configuration do
      has :root_url,
          classes: [String],
          default: ENV['APTIBLE_API_ROOT_URL'] || 'https://api.aptible.com'
    end
  end
end

require 'aptible/api/resource'
require 'aptible/api/agent'
