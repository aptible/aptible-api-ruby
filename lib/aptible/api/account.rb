module Aptible
  class Api::Account < Api::Resource
    has_many :apps
    has_many :disks
    has_many :services

    def production?
      type == 'production'
    end

    def operations
      # TODO: Implement /accounts/:id/operations
      []
    end
  end
end
