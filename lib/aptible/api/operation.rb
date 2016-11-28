require 'aptible/auth'

module Aptible
  module Api
    class Operation < Resource
      belongs_to :account
      belongs_to :resource

      has_many :ssh_portal_connections

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
      field :user_name
      field :user_email
      field :created_at, type: Time
      field :updated_at, type: Time

      def user
        auth = Aptible::Auth::User.new(token: token, headers: headers)
        auth.find_by_url(links['user'].href)
      rescue
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
