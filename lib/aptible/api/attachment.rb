# rubocop:disable ClassAndModuleChildren
module Aptible
  class Api::Attachment < Api::Resource
    belongs_to :disk
  end
end
