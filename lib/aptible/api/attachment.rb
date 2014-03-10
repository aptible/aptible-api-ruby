module Aptible
  class Api::Attachment < Api::Resource
    belongs_to :disk
  end
end
