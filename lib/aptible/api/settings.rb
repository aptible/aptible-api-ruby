module Aptible
  module Api
    class Setting < Resource
      belongs_to :resource

      field :id
      field :keys
      field :sensitive_keys
      field :created_at, type: Time
    end
  end
end
