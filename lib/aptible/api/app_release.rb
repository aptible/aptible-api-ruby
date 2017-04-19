module Aptible
  module Api
    class AppRelease < Resource
      has_many :releases
      belongs_to :app
      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
