module Aptible
  module Api
    class Plan < Resource
      field :id
      field :name
      field :container_memory_limit_mb
      field :cpu_allowed_profiles
      field :disk_limit_mib
      field :ephemeral_session_limit
      field :environment_limit
      field :vhost_limit
      field :compliance_dashboard_access
      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
