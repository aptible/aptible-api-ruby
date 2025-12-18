module Aptible
  module Api
    class Setting < Resource
      belongs_to :resource

      field :id
      field :settings
      field :sensitive_settings
      field :created_at, type: Time
    end
  end
end
