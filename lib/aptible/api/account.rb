require 'aptible/auth'
require 'stripe'

module Aptible
  module Api
    class Account < Resource
      has_many :apps
      has_many :databases
      has_many :disks
      has_many :services
      has_many :permissions

      field :id
      field :type
      field :name
      field :handle
      field :number
      field :type
      field :activated, type: Aptible::Resource::Boolean
      field :syslog_host
      field :syslog_port
      field :created_at, type: Time
      field :updated_at, type: Time
      field :billforward_subscription_id

      def billforward_subscription
        return nil if billforward_subscription_id.nil?
        @billforward_subscription ||=
        Aptible::BillForward::Subscription.find(billforward_subscription_id)
      end

      def production?
        type == 'production'
      end

      def operations
        # TODO: Implement /accounts/:id/operations
        []
      end

      def dumptruck_port
        # TODO: Fetch from API
        45022
      end

      def organization
        auth = Aptible::Auth::Organization.new(token: token, headers: headers)
        auth.find_by_url(links['organization'].href)
      end

      def self.generate_handle(organization_name, plan_id)
        rand = ('a'..'z').to_a.shuffle[0, 8].join
        "#{organization_name.parameterize}-#{plan_id}-#{rand}"
      end
    end
  end
end
