module Aptible
  class Api::Image < Api::Resource
    belongs_to :app
  end
end
