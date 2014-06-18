require 'aptible/auth'
require 'stripe'

module Aptible
  module Api
    class Account < Resource
      has_many :apps
      has_many :databases
      has_many :disks
      has_many :services

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
      field :stripe_subscription_id
      field :stripe_subscription_status

      def subscription
        return if stripe_subscription_id.nil?
        @subscription ||= organization.stripe_customer
                                      .subscriptions
                                      .retrieve(stripe_subscription_id)
      end

      def production?
        type == 'production'
      end

      # rubocop:disable PredicateName
      def has_subscription?
        !stripe_subscription_id.nil?
      end
      # rubocop:enable PredicateName

      def operations
        # TODO: Implement /accounts/:id/operations
        []
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
