module Aptible
  module Api
    class AwsInstance < Resource
      belongs_to :stack
      belongs_to :ami
      has_many :operations
      has_many :instance_layer_memberships
      embeds_many :databases

      field :id
      field :instance_id
      field :instance_type
      field :availability_zone
      field :name
      field :status
      field :created_at, type: Time
      field :updated_at, type: Time

      def stack_layers
        instance_layer_memberships.map(&:links)
                                  .map(&:stack_layer)
                                  .uniq(&:href)
                                  .map(&:get)
      end

      # Layers as an array of strings
      def layers
        stack_layers.map(&:name)
      end
    end
  end
end
