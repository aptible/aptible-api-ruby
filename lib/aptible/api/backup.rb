module Aptible
  module Api
    class Backup < Resource
      belongs_to :account
      belongs_to :database
      belongs_to :database_image
      has_many :operations

      has_one :copied_from
      has_many :copies

      field :id
      field :aws_snapshot_id
      field :aws_region
      field :created_at, type: Time
      field :updated_at, type: Time

      def database_with_deleted
        db_id = links['database'].href.split('/').last
        Database.find(db_id, with_deleted: true, token: token, headers: headers)
      end
    end
  end
end
