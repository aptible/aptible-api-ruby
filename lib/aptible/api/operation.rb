module Aptible
  class Api::Operation < Api::Resource
    belongs_to :resource

    def user
      auth = Aptible::Auth::User.new(token: token, headers: headers)
      auth.find_by_url(links['user'].href)
    end
  end
end
