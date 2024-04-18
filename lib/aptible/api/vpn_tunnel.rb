module Aptible
  module Api
    class VpnTunnel < Resource
      belongs_to :stack
      has_many :operations

      field :id
      field :stack_id
      field :handle
      field :psk
      field :phase_1_alg
      field :phase_1_dh_group
      field :phase_1_lifetime
      field :phase_2_alg
      field :phase_2_dh_group
      field :phase_2_lifetime
      field :peer_id
      field :our_gateway
      field :our_networks
      field :peer_gateway
      field :peer_networks
      field :key_exchange
      field :auto
      field :status
      field :backend
      field :deleted_at, type: Time
      field :created_at, type: Time
      field :updated_at, type: Time

      def provisioned?
        status == 'provisioned'
      end
    end
  end
end
