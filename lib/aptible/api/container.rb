# rubocop:disable ClassAndModuleChildren
module Aptible
  class Api::Container < Api::Resource
    belongs_to :release
  end
end
