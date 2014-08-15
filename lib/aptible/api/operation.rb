require 'aptible/auth'

module Aptible
  module Api
    class Operation < Resource
      belongs_to :resource

      field :id
      field :type
      field :status
      field :git_ref
      field :docker_ref
      field :certificate
      field :private_key
      field :env
      field :container_count
      field :disk_size
      field :command
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
