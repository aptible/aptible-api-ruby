module Aptible
  module Api
    class BackupRetentionPolicy < Resource
      belongs_to :account

      field :id
      field :daily
      field :monthly
      field :yearly
      field :pitr_days
      field :make_copy, type: Aptible::Resource::Boolean
      field :created_at, type: Time
      field :updated_at, type: Time
      field :keep_final, type: Aptible::Resource::Boolean
      field :account_id
    end
  end
end
