require 'active_support/inflector'

module Aptible
  class Api::Resource < Api
    def self.basename
      name.split('::').last.downcase.pluralize
    end

    def self.collection_url
      config = Aptible::Api.configuration
      config.root_url.chomp('/') + "/#{basename}"
    end

    def self.all(options = {})
      resource = find_by_url(collection_url, options)
      resource.send(basename).entries
    end

    def self.find(id, options = {})
      find_by_url("#{collection_url}/#{id}", options)
    end

    def self.find_by_url(url, options = {})
      # REVIEW: Should exception be raised if return type mismatch?
      new(options).find_by_url(url)
    rescue
      nil
    end

    def self.create(options)
      token = options.delete(:token)
      auth = Api.new(token: token)
      auth.send(basename).create(options)
    end

    # rubocop:disable PredicateName
    def self.has_many(relation)
      define_has_many_getter(relation)
      define_has_many_setter(relation)
    end
    # rubocop:enable PredicateName

    private

    def self.define_has_many_getter(relation)
      define_method relation do
        get unless loaded
        if (memoized = instance_variable_get("@#{relation}"))
          memoized
        elsif links[relation]
          instance_variable_set("@#{relation}", links[relation].entries)
        end
      end
    end

    def self.define_has_many_setter(relation)
      define_method "create_#{relation.to_s.singularize}" do |options = {}|
        get unless loaded
        links[relation].create(options)
      end
    end
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
