module Aptible
  module Api
    class RdsDatabase < Resource
      belongs_to :account
      has_many :operations

      field :id
      field :type
      field :handle
      field :passphrase
      field :connection_url
      field :status
      field :engine
      field :engine_version
      field :instance_class
      field :disk_size, type: Integer
      field :disk_type
      field :provisioned_iops
      field :created_at, type: Time
      field :updated_at, type: Time
      field :deleted_at, type: Time

    end
  end
end
