# rubocop:disable ClassAndModuleChildren
module Aptible
  class Api::Database < Api::Resource
    belongs_to :account
    has_many :operations
    has_many :permissions
  end
end
