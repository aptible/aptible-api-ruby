module Aptible
  module Api
    class ExternalAwsAccount < Resource
      has_many :external_aws_resources

      field :id
      field :organization_id
      field :aws_account_id
      field :account_name
      field :aws_region_primary
      field :discovery_enabled, type: Aptible::Resource::Boolean
      field :discovery_frequency
      field :last_discovery_at, type: Time
      field :status
      field :deleted_at, type: Time
      field :created_at, type: Time
      field :updated_at, type: Time

      def organization_url
        links['organization'].href
      end

      def organization
        return @organization if @organization

        auth = Aptible::Auth::Organization.new(token: token, headers: headers)
        @organization = auth.find_by_url(organization_url)
      end

      def check!
        response = HyperResource::Link.new(
          self,
          'href' => "#{href}/check"
        ).get
        ExternalAwsAccountCheckResponse.new(
          state: response.attributes['state'],
          checks: (response.attributes['checks'] || []).map do |c|
            ExternalAwsAccountCheck.new(
              check_name: c['check_name'],
              state: c['state'],
              details: c['details']
            )
          end
        )
      end
    end
  end
end
