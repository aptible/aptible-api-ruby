module Aptible
  module Api
    class InstanceLayerMembership < Resource
      belongs_to :stack_layer
      belongs_to :aws_instance
    end
  end
end
