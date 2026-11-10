module Aptible
  module Api
    class WafConfig < Resource
      belongs_to :vhost

      field :id
      field :status
      field :enabled_rulesets
      field :created_at, type: Time
      field :updated_at, type: Time
      field :deleted_at, type: Time
    end
  end
end
