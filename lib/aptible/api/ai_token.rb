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
      field :gateway_url
      # User (on whose behalf) details
      field :created_by_user_id
      field :created_by_user_name
      field :created_by_user_email
      # Actor (who performed) details
      field :created_by_actor_id
      field :created_by_actor_name
      field :created_by_actor_email
      # Revoked by user details
      field :revoked_by_user_id
      field :revoked_by_user_name
      field :revoked_by_user_email
      # Revoked by actor details
      field :revoked_by_actor_id
      field :revoked_by_actor_name
      field :revoked_by_actor_email

      # Note: The 'token' field from API response is accessible via
      # attributes['token'] to avoid conflict with aptible-resource's
      # internal token handling (used for auth bearer token)
      def api_key
        attributes['token']
      end
    end
  end
end

