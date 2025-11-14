module Aptible
  module Api
    class AppDatabaseConnection < Resource
      belongs_to :app
      belongs_to :database
      belongs_to :external_aws_resource
      belongs_to :database_credential

      field :id
      field :database_name
      field :database_user
      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
