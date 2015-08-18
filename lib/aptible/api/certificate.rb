module Aptible
  module Api
    class Certificate < Resource
      belongs_to :account
      has_many :operations
      has_many :vhosts

      field :id
      field :body
      field :private_key
      field :common_name
      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
