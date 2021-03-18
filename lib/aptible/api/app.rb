module Aptible
  module Api
    class App < Resource
      belongs_to :account
      belongs_to :current_configuration
      embeds_one :current_image
      embeds_one :last_operation
      embeds_one :last_deploy_operation
      has_many :configurations
      has_many :images
      has_many :operations
      has_many :vhosts
      has_many :ephemeral_sessions
      has_many :aws_instances
      embeds_many :services

      field :id
      field :handle
      field :git_repo
      field :created_at, type: Time
      field :updated_at, type: Time
      field :status
      field :deployment_method

      def provisioned?
        status == 'provisioned'
      end
    end
  end
end
