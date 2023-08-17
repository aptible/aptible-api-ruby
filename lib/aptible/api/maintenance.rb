module Aptible
  module Api
    class MaintenanceApp < Resource
      field :id
      field :handle
      field :created_at
      field :updated_at
      field :status
      field :maintenance_deadline
      def self.collection_href
        "/maintenances/apps"
      end
    end
    class MaintenanceDatabase < Resource
      field :id
      field :handle
      field :created_at
      field :updated_at
      field :status
      field :maintenance_deadline
      def self.collection_href
        "/maintenances/databases"
      end
    end
  end
end

