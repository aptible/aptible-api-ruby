module Aptible
  module Api
    class Backup < Resource
      belongs_to :account
      belongs_to :database
      has_many :operations

      field :id
      field :aws_snapshot_id
      field :aws_region
      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
