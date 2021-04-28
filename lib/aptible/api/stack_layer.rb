module Aptible
  module Api
    class StackLayer < Resource
      belongs_to :stack
      belongs_to :lead_instance
      has_many :instance_layer_memberships

      field :id
      field :name
      field :opsworks_layer_id
      field :lead_instance_hostname
      field :dns, type: Aptible::Resource::Boolean
      field :dns_name
      field :dns_provisioned_instance_id
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
