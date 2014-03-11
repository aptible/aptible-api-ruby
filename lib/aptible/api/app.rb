module Aptible
  class Api::App < Api::Resource
    belongs_to :account
    has_many :configurations
    has_many :images
    has_many :operations
    has_many :permissions
    has_many :services
  end
end
