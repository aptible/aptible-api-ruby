module Aptible
  module Api
    class AiAgent < Resource
      belongs_to :account
      belongs_to :current_configuration
      belongs_to :current_setting

      has_many :configurations
      has_many :settings
      has_many :operations

      field :id
      field :name
      field :description
      field :execution_role_arn
      field :agent_arn
      field :ecr_repository_arn
      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
