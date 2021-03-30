module Aptible
  module Api
    class VpnTunnelConfiguration < Resource
      belongs_to :managed_vpn_tunnel
      has_many :vpn_tunnel_configuration_vhosts

      field :id
      field :peer_ip
      field :peer_id
      field :peer_networks
      field :expose_entire_stack
      field :outbound_ip
      field :phase1_encryption_alg
      field :phase1_auth_alg
      field :phase1_dh_group
      field :phase1_lifetime
      field :phase2_encryption_alg
      field :phase2_auth_alg
      field :phase2_dh_group
      field :phase2_lifetime
      field :pre_shared_key
      field :created_at, type: Time
      field :updated_at, type: Time

      def pfs?
        !phase2_dh_group.nil?
      end

      def our_networks
        networks = vpn_tunnel_configuration_vhosts.map do |cv|
          ["#{cv.nat_ip}/32", cv.vhost.external_host]
        end

        if outbound_ip
          stack_name = managed_vpn_tunnel.stack.name
          networks.unshift(["#{outbound_ip}/32", "bastion-layer-#{stack_name}.aptible.in"])
        end

        networks
      end

      def phase1_alg
        "#{phase1_encryption_alg}-#{phase1_auth_alg};#{phase1_dh_group}"
      end

      def phase2_alg
        "#{phase1_encryption_alg}-#{phase1_auth_alg};#{phase2_dh_group}"
      end
    end
  end
end
