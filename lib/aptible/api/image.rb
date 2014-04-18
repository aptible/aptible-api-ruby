module Aptible
  module Api
    class Image < Resource
      belongs_to :app
    end
  end
end
