module Aptible
  module Api
    class Database < Resource
      belongs_to :account
      has_one :disk
      has_one :service
      has_many :operations
      has_many :permissions

      field :id
      field :handle
      field :type
      field :passphrase
      field :connection_url
      field :provisioned, type: Aptible::Resource::Boolean
      field :created_at, type: Time
      field :updated_at, type: Time

      def failed?
        # TODO: Add failed status at API level
        operations.select { |o| o.type == 'provision' }.all?(&:failed?)
      end
    end
  end
end
