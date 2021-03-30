module Aptible
  module Api
    class ManagedVpnTunnel < Resource
      belongs_to :stack
      embeds_one :current_configuration
      has_many :configurations
      has_many :operations

      field :id
      field :gateway_ip
      field :handle
      field :status
      field :tunnel_status
      field :created_at, type: Time
      field :updated_at, type: Time

      def provisioned?
        status == 'provisioned'
      end

      def running?
        tunnel_status == 'running'
      end
    end
  end
end
