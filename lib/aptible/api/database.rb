module Aptible
  module Api
    class Database < Resource
      belongs_to :account
      belongs_to :database_image
      belongs_to :current_configuration
      embeds_one :last_operation
      embeds_one :disk
      has_one :service
      has_one :initialize_from
      has_many :operations
      has_many :backups
      has_many :dependents
      has_many :configurations
      has_many :aws_instances
      embeds_many :database_credentials

      field :id
      field :handle
      field :type
      field :passphrase
      field :connection_url
      field :created_at, type: Time
      field :updated_at, type: Time
      field :status
      field :docker_repo
      field :port_mapping
      field :logical_replica

      def failed?
        # TODO: Add failed status at API level
        return false if provisioned?

        operations.select { |o| o.type == 'provision' }.all?(&:failed?)
      end

      def provisioned?
        status == 'provisioned'
      end

      def current_configuration_with_deleted
        id = links['current_configuration'].href.split('/').last
        Aptible::Api::Configuration.find(
          id, with_deleted: true, token: token, headers: headers
        )
      end

      def disk_with_deleted
        id = links['disk'].href.split('/').last
        Aptible::Api::Disk.find(
          id, with_deleted: true, token: token, headers: headers
        )
      end
    end
  end
end
