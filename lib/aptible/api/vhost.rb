module Aptible
  module Api
    class Vhost < Resource
      belongs_to :service
      has_many :operations

      def provisioned?
        provisioned
      end
    end
  end
end
