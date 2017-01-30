module Aptible
  module Api
    class Disk < Resource
      belongs_to :account
      belongs_to :database
      has_many :operations

      field :id
      field :handle
      field :ebs_volume_id
      field :ebs_volume_type
      field :filesystem
      field :passphrase
      field :key_bytes
      field :size
      field :host
      field :device
      field :attached, type: Aptible::Resource::Boolean
      field :created_at, type: Time
      field :updated_at, type: Time
      field :ec2_instance_id
      field :baseline_iops
    end
  end
end
