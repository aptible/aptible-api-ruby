module Aptible
  module Api
    class App < Resource
      belongs_to :account
      belongs_to :current_configuration
      belongs_to :current_setting
      has_one :last_code_scan_result
      has_one :current_deployment
      embeds_one :current_image
      embeds_one :last_operation
      embeds_one :last_deploy_operation
      has_many :configurations
      has_many :settings
      has_many :images
      has_many :operations
      has_many :vhosts
      has_many :ephemeral_sessions
      has_many :aws_instances
      has_many :prerelease_commands
      has_many :service_definitions
      has_many :code_scan_results
      embeds_many :services
      has_many :app_database_connections

      field :id
      field :handle
      field :git_repo
      field :created_at, type: Time
      field :updated_at, type: Time
      field :status
      field :deployment_method
      field :hooks

      def provisioned?
        status == 'provisioned'
      end
    end
  end
end
