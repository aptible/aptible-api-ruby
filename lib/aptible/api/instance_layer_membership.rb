module Aptible
  module Api
    class InstanceLayerMembership < Resource
      belongs_to :stack_layer
      belongs_to :aws_instance

      field :drained, type: Aptible::Resource::Boolean
    end
  end
end
