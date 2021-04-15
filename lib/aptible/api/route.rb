module Aptible
  module Api
    class Route < Resource
      belongs_to :stack
      belongs_to :resource

      field :id
      field :status
      field :route_table_id
      field :destination_cidr_block
      field :destination_type
      field :destination_value
      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
