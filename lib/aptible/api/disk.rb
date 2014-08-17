module Aptible
  module Api
    class Disk < Resource
      belongs_to :account
      belongs_to :database
      has_many :operations

      field :id
      field :handle
      field :ebs_volume_id
      field :filesystem
      field :passphrase
      field :size
      field :host
      field :device
      field :attached, type: Aptible::Resource::Boolean
      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
