module Aptible
  class Api::Release < Api::Resource
    belongs_to :service
    has_many :containers
  end
end
