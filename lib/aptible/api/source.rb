module Aptible
  module Api
    class Source < Resource
      has_many :apps
      has_many :deployments

      field :id
      field :organization_id
      field :qualified_name
      field :url

      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
