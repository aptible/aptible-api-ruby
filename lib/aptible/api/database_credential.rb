module Aptible
  module Api
    class DatabaseCredential < Resource
      belongs_to :database

      field :id
      field :type
      field :default, type: Aptible::Resource::Boolean
      field :connection_url
      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
