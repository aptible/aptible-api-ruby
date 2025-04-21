module Aptible
  module Api
    class DatabaseImage < Resource
      # has_many :databases

      field :id
      field :description
      field :type
      field :docker_repo
      field :visible, type: Aptible::Resource::Boolean
      field :default, type: Aptible::Resource::Boolean
      field :created_at, type: Time
      field :updated_at, type: Time
      field :pitr_supported, type: Aptible::Resource::Boolean
    end
  end
end
