module Aptible
  module Api
    class AiToken < Resource
      belongs_to :account

      field :id
      field :name
      field :created_at
      field :updated_at
      field :expires_at
      field :last_used_at
      field :revoked_at

      # Note: The 'token' field from API response is accessible via
      # attributes['token'] to avoid conflict with aptible-resource's
      # internal token handling (used for auth bearer token)
      def api_key
        attributes['token']
      end
    end
  end
end

