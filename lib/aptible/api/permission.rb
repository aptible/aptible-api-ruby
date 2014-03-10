module Aptible
  class Api::Permission < Api::Resource
    belongs_to :resource
  end
end
