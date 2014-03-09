module Aptible
  class Api::Disk < Api::Resource
    has_many :operations
    has_many :permissions
  end
end
