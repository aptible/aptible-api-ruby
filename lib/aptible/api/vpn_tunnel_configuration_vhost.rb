module Aptible
  module Api
    class VpnTunnelConfigurationVhost < Resource
      belongs_to :vpn_tunnel
      belongs_to :vhost

      field :id
      field :nat_ip
      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
