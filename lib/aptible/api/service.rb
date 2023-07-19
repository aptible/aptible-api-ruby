module Aptible
  module Api
    class Service < Resource
      belongs_to :account
      belongs_to :app
      belongs_to :database
      belongs_to :current_release
      has_many :vhosts
      has_many :operations
      has_many :releases
      has_many :disk_attachments

      field :id
      field :handle
      field :docker_repo
      field :docker_ref
      field :process_type
      field :command
      field :container_count
      field :container_memory_limit_mb
      field :instance_class
      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
