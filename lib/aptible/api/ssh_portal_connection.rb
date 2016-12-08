module Aptible
  module Api
    class SshPortalConnection < Resource
      belongs_to :account
      belongs_to :log_drain
      belongs_to :operation

      field :action
    end
  end
end
