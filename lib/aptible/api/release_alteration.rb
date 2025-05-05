module Aptible
  module Api
    class ReleaseAlteration < Resource
      belongs_to :release
      belongs_to :service
      has_many :containers

      field :id
      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
