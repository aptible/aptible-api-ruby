module Aptible
  module Api
    class ExternalAwsAccountCheckResponse
      attr_reader :state, :checks

      def initialize(state:, checks:)
        @state = state
        @checks = checks
      end
    end

    class ExternalAwsAccountCheck
      attr_reader :check_name, :state, :details

      def initialize(check_name:, state:, details:)
        @check_name = check_name
        @state = state
        @details = details
      end
    end
  end
end
