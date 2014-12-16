module Aptible
  module Api
    class Vhost < Resource
      belongs_to :service
      has_many :operations

      field :id
      field :virtual_domain
      field :certificate
      field :private_key
      field :type
      field :elastic_load_balancer_name
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
      field :default

      def account
        service.account
      end

      def provisioned?
        status == 'provisioned'
      end
    end
  end
end
