module Aptible
  module Api
    class Configuration < Resource
      belongs_to :resource

      field :id
      field :env
    end
  end
end
