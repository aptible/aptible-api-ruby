module Aptible
  class Api::Proxy < Api::Resource
    belongs_to :service
  end
end
