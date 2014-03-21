# rubocop:disable ClassAndModuleChildren
module Aptible
  class Api::Vhost < Api::Resource
    belongs_to :service
    has_many :operations

    def provisioned?
      provisioned
    end
  end
end
