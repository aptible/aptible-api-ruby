module Aptible
  module Api
    class Release < Resource
      belongs_to :service
      embeds_one :app_release
      has_many :containers

      field :id
      field :docker_repo
      field :docker_ref
      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
