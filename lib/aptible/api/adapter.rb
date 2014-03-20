# rubocop:disable ClassAndModuleChildren
module Aptible
  class Api::Adapter < HyperResource::Adapter::HAL_JSON
    class << self
      # rubocop:disable MethodLength
      def get_data_type_from_object(object)
        return nil unless object

        if (type = object['_type'])
          if type.respond_to?(:camelize)
            type.camelize
          else
            type[0].upcase + type[1..-1]
          end
        else
          'Resource'
        end
      end
      # rubocop:enable MethodLength
    end
  end
end
