module Aptible
  module Api
    class LogDrain < Resource
      belongs_to :account
      has_many :operations

      field :id
      field :handle
      field :drain_type
      field :drain_host
      field :drain_port
      field :created_at, type: Time
      field :updated_at, type: Time
      field :status
    end
  end
end
