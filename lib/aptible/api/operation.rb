require 'aptible/auth'

module Aptible
  module Api
    class Operation < Resource
      belongs_to :resource
      belongs_to :account
      belongs_to :destination_account

      has_many :ssh_portal_connections
      has_many :ephemeral_sessions

      field :id
      field :type
      field :status
      field :cancelled
      field :aborted
      field :git_ref
      field :docker_ref
      field :certificate
      field :private_key
      field :env
      field :container_size
      field :container_count
      field :disk_size
      field :command
      field :destination_region
      field :interactive
      field :user_name
      field :user_email
      field :immediate
      field :created_at, type: Time
      field :updated_at, type: Time

      def user
        auth = Aptible::Auth::User.new(token: token, headers: headers)
        auth.find_by_url(links['user'].href)
      rescue StandardError
        nil
      end

      def succeeded?
        status == 'succeeded'
      end

      def failed?
        status == 'failed'
      end
    end
  end
end
