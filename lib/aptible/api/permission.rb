module Aptible
  module Api
    class Permission < Resource
      belongs_to :account

      field :id
      field :scope
    end
  end
end
