module Aptible
  module Api
    class StackLayer < Resource
      belongs_to :stack
      belongs_to :lead_instance
      has_many :instance_layer_memberships
      has_many :aws_instances
      embeds_one :ami_release

      field :id
      field :name
      field :lead_instance_hostname
      field :dns, type: Aptible::Resource::Boolean
      field :internal_only_dns, type: Aptible::Resource::Boolean
      field :dns_name
      field :dns_provisioned_instance_id
      field :outbound, type: Aptible::Resource::Boolean
      field :created_at, type: Time
      field :updated_at, type: Time

      def dns_provisioned?
        !dns_provisioned_instance_id.nil? &&
          !lead_instance.nil? &&
          lead_instance.id == dns_provisioned_instance_id
      end
    end
  end
end
