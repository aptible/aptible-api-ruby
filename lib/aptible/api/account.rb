require 'aptible/auth'

module Aptible
  module Api
    class Account < Resource
      belongs_to :stack

      has_many :apps
      has_many :backups
      has_many :certificates
      has_many :databases
      has_many :disks
      has_many :persistent_disks
      has_many :disk_attachments
      has_many :services
      has_many :permissions
      has_many :metric_drains
      has_many :backup_retention_policy
      embeds_many :log_drains

      field :id
      field :type
      field :name
      field :handle
      field :number
      field :type
      field :activated, type: Aptible::Resource::Boolean
      field :syslog_host
      field :syslog_port
      field :organization_id
      field :created_at, type: Time
      field :updated_at, type: Time
      field :gentlemanjerry_endpoint
      field :gentlemanjerry_certificate
      field :gentlemanjerry_docker_name
      field :gentlemanjerry_instance_id
      field :ca_body
      field :ca_private_key

      def production?
        type == 'production'
      end

      def operations
        # TODO: Implement /accounts/:id/operations
        []
      end

      def dumptruck_port
        # TODO: Fetch from API
        45022
      end

      def organization_url
        links['organization'].href
      end

      def organization
        return @organization if @organization

        auth = Aptible::Auth::Organization.new(token: token, headers: headers)
        @organization = auth.find_by_url(organization_url)
      end

      def self.generate_handle(organization_name, plan_id)
        rand = ('a'..'z').to_a.sample(8).join
        "#{organization_name.parameterize}-#{plan_id}-#{rand}"
      end

      def each_orphaned_backup
        base_href = "#{links['backups'].base_href}?orphaned=true"
        Backup.each_page(href: base_href, headers: headers,
                         token: token) do |page|
          page.each { |entry| yield entry }
        end
      end
    end
  end
end
