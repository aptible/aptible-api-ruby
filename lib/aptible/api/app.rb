module Aptible
  module Api
    class App < Resource
      belongs_to :account
      belongs_to :current_configuration
      belongs_to :current_image
      has_many :configurations
      has_many :images
      has_many :operations
      has_many :permissions
      has_many :services

      field :id
      field :handle
      field :git_repo
      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
