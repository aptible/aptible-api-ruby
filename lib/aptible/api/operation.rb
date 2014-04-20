module Aptible
  module Api
    class Operation < Resource
      belongs_to :resource

      def user
        require 'aptible/auth'

        auth = Aptible::Auth::User.new(token: token, headers: headers)
        auth.find_by_url(links['user'].href)
      end
    end
  end
end
