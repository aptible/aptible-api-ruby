module Aptible
  module Api
    class Container < Resource
      belongs_to :release

      field :id
      field :host
      field :port
      field :status
      field :docker_name
      field :memory_limit
      field :created_at, type: Time
      field :updated_at, type: Time
      field :billforward_usage_session_id
      field :layer
      field :aws_instance_id
    end
  end
end
