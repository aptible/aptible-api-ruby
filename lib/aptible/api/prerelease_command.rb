module Aptible
  module Api
    class PrereleaseCommand < Resource
      belongs_to :app

      field :id

      field :command
      field :index
      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
