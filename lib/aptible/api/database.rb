module Aptible
  module Api
    class Database < Resource
      belongs_to :account
      embeds_one :last_operation
      embeds_one :disk
      has_one :service
      has_many :operations

      field :id
      field :handle
      field :docker_hostname
      field :type
      field :passphrase
      field :connection_url
      field :created_at, type: Time
      field :updated_at, type: Time
      field :status
      field :docker_repo

      def failed?
        # TODO: Add failed status at API level
        return false if provisioned?
        operations.select { |o| o.type == 'provision' }.all?(&:failed?)
      end

      def provisioned?
        status == 'provisioned'
      end
    end
  end
end
