module Aptible
  module Api
    class Permission < Resource
      belongs_to :resource

      field :id
      field :scope
    end
  end
end
