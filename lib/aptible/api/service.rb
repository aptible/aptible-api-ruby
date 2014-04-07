# rubocop:disable ClassAndModuleChildren
module Aptible
  class Api::Service < Api::Resource
    belongs_to :account
    belongs_to :app
    belongs_to :database
    belongs_to :current_release
    has_many :vhosts
    has_many :operations
    has_many :permissions
    has_many :releases
  end
end
