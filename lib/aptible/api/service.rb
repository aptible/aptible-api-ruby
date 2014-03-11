module Aptible
  class Api::Service < Api::Resource
    belongs_to :account
    belongs_to :app
    has_many :vhosts
    has_many :operations
    has_many :permissions
    has_many :proxies
    has_many :releases
  end
end
