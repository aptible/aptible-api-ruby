module Aptible
  class Api::Service < Api::Resource
    has_many :vhosts
    has_many :operations
    has_many :permissions
    has_many :proxies
    has_many :releases
  end
end
