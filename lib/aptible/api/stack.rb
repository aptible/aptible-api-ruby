module Aptible
  module Api
    class Stack < Resource
      has_many :aws_instances
      has_many :stack_layers
      has_many :operations

      field :id
      field :type
      field :name
      field :version
      field :region
      field :default, type: Aptible::Resource::Boolean
      field :ssh_host_dsa_public_key
      field :ssh_host_rsa_public_key
      field :ssh_host_ecdsa_public_key
      field :ssh_portal_host
      field :ssh_portal_port
      field :created_at, type: Time
      field :updated_at, type: Time
    end
  end
end
