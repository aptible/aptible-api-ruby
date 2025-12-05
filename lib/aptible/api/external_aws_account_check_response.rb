module Aptible
  module Api
    ExternalAwsAccountCheckResponse = Struct.new("ExternalAwsAccountCheckResponse", :state, :checks, keyword_init: true)
    ExternalAwsAccountCheck = Struct.new("ExternalAwsAccountCheck", :check_name, :state, :details, keyword_init: true)
  end
end
