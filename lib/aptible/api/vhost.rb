module Aptible
  module Api
    class Vhost < Resource
      belongs_to :service
      belongs_to :certificate
      has_many :operations

      field :id
      field :virtual_domain
      field :type
      field :application_load_balancer_arn
      field :elastic_load_balancer_name
      field :security_group_id
      field :external_host
      field :external_http_port
      field :external_https_port
      field :internal_host
      field :internal_http_port
      field :internal_https_port
      field :docker_name
      field :created_at, type: Time
      field :updated_at, type: Time
      field :status
      field :default, type: Aptible::Resource::Boolean
      field :internal, type: Aptible::Resource::Boolean
      field :acme, type: Aptible::Resource::Boolean
      field :user_domain
      field :acme_status
      field :ip_whitelist
      field :acme_dns_challenge_host

      def account
        service.account
      end

      def provisioned?
        status == 'provisioned'
      end
    end
  end
end
