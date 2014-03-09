module Aptible
  class Api::App < Api::Resource
    has_many :configurations
    has_many :images
    has_many :operations
    has_many :permissions
  end
end
