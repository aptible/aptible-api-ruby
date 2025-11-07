module Aptible
  module Api
    class ExternalAwsDatabaseCredential < Resource
      belongs_to :external_aws_resource
      has_many :operations

      field :id
      field :type
      field :default, type: Aptible::Resource::Boolean
      field :connection_url
      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
