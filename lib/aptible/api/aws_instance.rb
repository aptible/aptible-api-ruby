module Aptible
  module Api
    class AwsInstance < Resource
      belongs_to :stack
      belongs_to :ami
      has_many :operations
      embeds_many :databases

      field :id
      field :instance_id
      field :instance_type
      field :availability_zone
      field :name
      field :layers
      field :status
      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
