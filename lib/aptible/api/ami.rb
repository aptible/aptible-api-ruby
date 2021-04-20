module Aptible
  module Api
    class Ami < Resource
      belongs_to :ami_release

      field :id
      field :ami_id
      field :region
      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
