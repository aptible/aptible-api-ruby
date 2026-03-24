module Aptible
  module Api
    class McpGateway < Resource
      belongs_to :stack
      has_many :operations

      field :id
      field :name
      field :gateway_description
      field :gateway_arn
      field :gateway_url
      field :role_arn
      field :kms_key_arn
      field :status
      field :operation_id
      field :jwt_discovery_url
      field :created_at, type: Time
      field :updated_at, type: Time

      def provisioned?
        status == 'provisioned'
      end
    end
  end
end
