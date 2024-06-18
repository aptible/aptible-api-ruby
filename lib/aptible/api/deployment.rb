module Aptible
  module Api
    class Deployment < Resource
      belongs_to :operation
      belongs_to :app
      belongs_to :configuration
      belongs_to :image
      belongs_to :source

      field :id
      field :status
      field :docker_image
      field :docker_repository_url
      field :git_repository_url
      field :git_ref
      field :git_commit_sha
      field :git_commit_url
      field :git_commit_message
      field :git_commit_timestamp

      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
