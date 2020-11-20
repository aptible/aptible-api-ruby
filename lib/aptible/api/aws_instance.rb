module Aptible
  module Api
    class AwsInstance < Resource
      belongs_to :stack

      field :id
      field :instance_id
      field :ami
      field :instance_type
      field :availability_zone
      field :name
      field :layers
      field :created_at, type: Time
      field :updated_at, type: Time

      def provisioned?
        status == 'provisioned'
      end
    end
  end
end
