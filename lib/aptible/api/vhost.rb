module Aptible
  class Api::Vhost < Api::Resource
    belongs_to :service
  end
end
