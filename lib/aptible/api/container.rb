module Aptible
  module Api
    class Container < Resource
      belongs_to :release
      belongs_to :vhost
      belongs_to :log_drain
      belongs_to :metric_drain

      field :id
      field :host
      field :port
      field :status
      field :docker_name
      field :memory_limit
      field :created_at, type: Time
      field :updated_at, type: Time
      field :layer
      field :aws_instance_id
      field :port_mapping
      field :mounts
      field :instance_class
    end
  end
end
