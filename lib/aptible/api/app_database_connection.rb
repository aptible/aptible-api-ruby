module Aptible
    module Api
      class AppDatabaseConnection < Resource
        belongs_to :app
        belongs_to :resource
  
        field :id
        field :database_name
        field :database_user
        field :superuser
        field :created_at, type: Time
        field :updated_at, type: Time
      end
    end
  end
  