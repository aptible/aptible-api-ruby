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
require 'aptible/api/ami'
require 'aptible/api/ami_release'
require 'aptible/api/app'
require 'aptible/api/aws_instance'
require 'aptible/api/backup'
require 'aptible/api/certificate'
require 'aptible/api/configuration'
require 'aptible/api/container'
require 'aptible/api/database'
require 'aptible/api/database_image'
require 'aptible/api/disk'
require 'aptible/api/image'
require 'aptible/api/instance_layer_membership'
require 'aptible/api/log_drain'
require 'aptible/api/operation'
require 'aptible/api/permission'
require 'aptible/api/release'
require 'aptible/api/service'
require 'aptible/api/vhost'
require 'aptible/api/ssh_portal_connection'
require 'aptible/api/stack'
require 'aptible/api/stack_layer'
require 'aptible/api/database_credential'
require 'aptible/api/ephemeral_session'
require 'aptible/api/ephemeral_container'
require 'aptible/api/metric_drain'
require 'aptible/api/backup_retention_policy'
