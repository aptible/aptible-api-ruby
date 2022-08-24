module Aptible
  module Api
    class Stack < Resource
      has_many :aws_instances
      has_many :stack_layers
      has_many :operations

      field :id
      field :type
      field :name
      field :version
      field :region
      field :default, type: Aptible::Resource::Boolean
      field :ssh_host_dsa_public_key
      field :ssh_host_rsa_public_key
      field :ssh_host_ecdsa_public_key
      field :ssh_portal_host
      field :ssh_portal_port
      field :organization_id
      field :created_at, type: Time
      field :updated_at, type: Time

      def dns_layers
        stack_layers.reject! { |l| l.dns_name.blank? }
      end

      # This method is necessary because we need to include a query parameter
      # when requesting aws_instances.
      # Copied the important bits from
      # https://github.com/aptible/aptible-resource/blob/4708fb80a6c21013de07c2779ffc4928cee37d4e/lib/aptible/resource/base.rb#L138
      def aws_instances_with_deprovisionable
        get unless loaded

        return unless links['aws_instances']

        param = 'include_deprovisionable=true'
        href = "#{links['aws_instances'].base_href}?#{param}"
        self.class.all(
          href: href,
          token: token,
          headers: headers
        )
      end
    end
  end
end
