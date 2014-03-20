# rubocop:disable ClassAndModuleChildren
module Aptible
  class Api::Permission < Api::Resource
    belongs_to :resource
  end
end
