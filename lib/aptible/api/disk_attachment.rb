module Aptible
  module Api
    class DiskAttachment < Resource
      belongs_to :account
      embeds_one :persistent_disk
      embeds_one :service

      has_many :operations

      field :id
      field :mount_point
      field :created_at, type: Time
      field :updated_at, type: Time
      field :deleted_at, type: Time
    end
  end
end
