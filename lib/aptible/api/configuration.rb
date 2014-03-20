# rubocop:disable ClassAndModuleChildren
module Aptible
  class Api::Configuration < Api::Resource
    belongs_to :resource
  end
end
