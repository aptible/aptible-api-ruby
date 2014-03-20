# rubocop:disable ClassAndModuleChildren
module Aptible
  class Api::Vhost < Api::Resource
    belongs_to :service

    def provisioned?
      provisioned
    end
  end
end
