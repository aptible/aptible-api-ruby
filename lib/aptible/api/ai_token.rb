module Aptible
  module Api
    class AiToken < Resource
      belongs_to :account

      field :id
      field :key_alias
      field :note
      field :status
      field :gateway_url
      field :created_at, type: Time
      field :created_by
      field :updated_at, type: Time
      field :revoked_at, type: Time
      field :revoked_by

      # Note: The 'token' field from API response is accessible via
      # attributes['token'] to avoid conflict with aptible-resource's
      # internal token handling (used for auth bearer token)
      def api_key
        attributes['token']
      end
    end
  end
end
