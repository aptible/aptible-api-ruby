module Aptible
  module Api
    class VpcEndpoint < Resource
      belongs_to :stack
      belongs_to :account

      field :id
      field :aws_vpc_endpoint_id
      field :aws_az_ids
      field :aws_az_id_arrays
      field :vpce_service_name
      field :asset_bundle_uid
      field :cloud_environment_id
      field :status
      field :created_at, type: Time
      field :updated_at, type: Time
      field :deleted_at, type: Time
    end
  end
end
