module Aptible
  module Api
    class Container < Resource
      belongs_to :release
    end
  end
end
