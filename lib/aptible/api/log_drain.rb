module Aptible
  module Api
    class LogDrain < Resource
      belongs_to :account
      belongs_to :database
      has_many :operations
      has_many :containers

      # Temporary until deploy-api renames this field
      embeds_one :new_backend
      # Necessary to avoid downtime when new_backend becomes backend
      embeds_one :backend

      field :id
      field :handle
      field :drain_type
      field :drain_host
      field :drain_port
      field :drain_username
      field :drain_password
      field :drain_databases
      field :drain_apps
      field :created_at, type: Time
      field :updated_at, type: Time
      field :status
      field :gentlemanjerry_host
      field :gentlemanjerry_port_mapping
      field :gentlemanjerry_certificate
      field :gentlemanjerry_docker_name
      field :gentlemanjerry_instance_id
      field :url
      field :logging_token
    end
  end
end
