require 'aptible/api/version'
require 'aptible/api/client'

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
