module Aptible
  module Api
    class LogDrain < Resource
      belongs_to :account
      has_many :operations

      field :id
      field :handle
      field :drain_type
      field :drain_host
      field :drain_port
      field :drain_username
      field :drain_password
      field :created_at, type: Time
      field :updated_at, type: Time
      field :status
      field :gentlemanjerry_endpoint
      field :gentlemanjerry_certificate
      field :gentlemanjerry_docker_name
      field :gentlemanjerry_instance_id
    end
  end
end
