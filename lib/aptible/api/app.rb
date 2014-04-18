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
    end
  end
end
