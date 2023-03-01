module Aptible
  module Api
    class OrganizationLimits < Resource
      field :id
      field :organization_id
      field :container_memory_limit_mb
      field :cpu_allowed_profiles
      field :vhost_limit
      field :disk_limit_mib
      field :ephemeral_session_limit
      field :environment_limit
      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
