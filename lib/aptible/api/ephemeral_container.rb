module Aptible
  module Api
    class EphemeralContainer < Resource
      belongs_to :ephemeral_session
      belongs_to :log_drain

      field :id

      field :docker_name
      field :layer
      field :interactive

      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
