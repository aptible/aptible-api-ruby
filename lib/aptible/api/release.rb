module Aptible
  class Api::Release < Api::Resource
    has_many :containers
  end
end
