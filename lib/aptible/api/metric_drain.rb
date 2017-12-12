module Aptible
  module Api
    class MetricDrain < Resource
      belongs_to :account
      has_many :operations
      has_many :containers

      field :id

      field :handle
      field :status
      field :drain_type
      field :drain_configuration

      field :aggregator_ca_certificate
      field :aggregator_ca_private_key_blob
      field :aggregator_host
      field :aggregator_port_mapping
      field :aggregator_docker_name
      field :aggregator_instance_id
      field :aggregator_allocation

      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
