module Aptible
  module Api
    class EphemeralSession < Resource
      belongs_to :app
      belongs_to :operation
      has_many :ephemeral_containers
      has_many :operations

      field :aws_instance_id
      field :host
      field :name

      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
