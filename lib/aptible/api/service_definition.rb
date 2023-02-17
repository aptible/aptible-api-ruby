module Aptible
  module Api
    class ServiceDefinition < Resource
      belongs_to :app

      field :id

      field :command
      field :process_type
      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
