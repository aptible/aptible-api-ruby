module Aptible
  module Api
    class ExternalAwsResource < Resource
      belongs_to :external_aws_account

      field :id
      field :resource_type
      field :resource_arn
      field :resource_id
      field :resource_name
      field :region
      field :metadata
      field :tags
      field :discovered_at, type: Time
      field :last_synced_at, type: Time
      field :sync_status
      field :deleted_at, type: Time
      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
