module Aptible
  module Api
    class ContainerVhostMembership < Resource
      belongs_to :container
      belongs_to :vhost

      field :id
      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
