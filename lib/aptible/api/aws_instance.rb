module Aptible
  module Api
    class AwsInstance < Resource
      belongs_to :stack
      has_many :operations
      embeds_many :databases

      field :id
      field :instance_id
      field :ami
      field :instance_type
      field :availability_zone
      field :name
      field :layers
      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
