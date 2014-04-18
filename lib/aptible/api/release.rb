module Aptible
  module Api
    class Release < Resource
      belongs_to :service
      has_many :containers
    end
  end
end
