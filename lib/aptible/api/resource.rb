require 'active_support/inflector'

module Aptible
  class Api::Resource < Api
    def self.collection_url
      basename = name.split('::').last
      config = Aptible::Api.configuration
      config.root_url.chomp('/') + "/#{basename.downcase.pluralize}"
    end

    def self.find(id)
      find_by_url("#{collection_url}/#{id}")
    end

    def self.find_by_url(url)
      # REVIEW: Should exception be raised if return type mismatch?
      new.find_by_url(url)
    rescue
      nil
    end

    # rubocop:disable PredicateName
    def self.has_many(relation)
      define_method relation do
        get unless loaded
        if (memoized = instance_variable_get("@#{relation}"))
          memoized
        elsif links[relation]
          instance_variable_set("@#{relation}", links[relation].entries)
        end
      end
    end
    # rubocop:enable PredicateName
  end
end

require 'aptible/api/account'
require 'aptible/api/app'
require 'aptible/api/attachment'
require 'aptible/api/configuration'
require 'aptible/api/container'
require 'aptible/api/disk'
require 'aptible/api/image'
require 'aptible/api/operation'
require 'aptible/api/permission'
require 'aptible/api/proxy'
require 'aptible/api/release'
require 'aptible/api/service'
require 'aptible/api/vhost'
