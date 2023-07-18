module Aptible
  module Api
    class PersistentDisk < Resource
      belongs_to :account
      has_many :operations
      has_many :disk_attachments

      field :id
      field :handle
      field :status
      field :disk_type
      field :size
      field :provisioned_iops
      field :aws_resource_id
      field :kms_arn
      field :modification_progress
      field :created_at, type: Time
      field :updated_at, type: Time
      field :deleted_at, type: Time
      field :baseline_iops
      field :availability_zone
    end
  end
end
