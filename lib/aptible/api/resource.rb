require 'aptible/resource'

module Aptible
  module Api
    class Resource < Aptible::Resource::Base
      def namespace
        'Aptible::Api'
      end

      def root_url
        Aptible::Api.configuration.root_url
      end
    end
  end
end

require 'aptible/api/account'
require 'aptible/api/app'
require 'aptible/api/configuration'
require 'aptible/api/container'
require 'aptible/api/database'
require 'aptible/api/disk'
require 'aptible/api/image'
require 'aptible/api/log_drain'
require 'aptible/api/operation'
require 'aptible/api/permission'
require 'aptible/api/release'
require 'aptible/api/service'
require 'aptible/api/vhost'
