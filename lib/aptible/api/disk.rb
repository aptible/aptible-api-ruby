# rubocop:disable ClassAndModuleChildren
module Aptible
  class Api::Disk < Api::Resource
    belongs_to :account
    belongs_to :database
    has_many :operations
    has_many :permissions
  end
end
