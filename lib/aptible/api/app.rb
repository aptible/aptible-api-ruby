module Aptible
  module Api
    class App < Resource
      belongs_to :account
      belongs_to :current_configuration
      belongs_to :current_app_release
      embeds_one :current_image
      embeds_one :last_operation
      embeds_one :last_deploy_operation
      has_many :app_releases
      has_many :configurations
      has_many :images
      has_many :operations
      has_many :vhosts
      embeds_many :services

      field :id
      field :handle
      field :git_repo
      field :created_at, type: Time
      field :updated_at, type: Time
      field :status

      def provisioned?
        status == 'provisioned'
      end
    end
  end
end
