module Aptible
  module Api
    class Permission < Resource
      belongs_to :resource
    end
  end
end
