module Aptible
  module Api
    class Service < Resource
      belongs_to :account
      belongs_to :app
      belongs_to :database
      belongs_to :current_release
      belongs_to :current_setting
      has_many :vhosts
      has_many :operations
      has_many :releases
      has_many :disk_attachments
      has_many :settings
      has_one :service_sizing_policy

      field :id
      field :handle
      field :docker_repo
      field :docker_ref
      field :process_type
      field :command
      field :container_count
      field :container_memory_limit_mb
      field :instance_class
      field :force_zero_downtime
      field :naive_health_check
      field :created_at, type: Time
      field :updated_at, type: Time
      field :release_operation_in_progress?, type: :boolean

      def reload_with_operation_status
        self.class.find(
          id, include_operation_status: true, token: token, headers: headers
        )
      end

      def create_service_sizing_policy!(params)
        params = { token: token }.merge(params)

        # First create a link object so we know where to go
        link = HyperResource::Link.new(
          self,
          'href' => "#{href}/service_sizing_policies"
        )

        # Now create the policy
        link.create(
          self.class.normalize_params(params)
        )
      end
    end
  end
end
