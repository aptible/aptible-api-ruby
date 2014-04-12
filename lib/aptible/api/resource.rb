require 'active_support/inflector'

# rubocop:disable ClassAndModuleChildren
module Aptible
  class Api::Resource < Api
    def delete
      # HyperResource/Faraday choke on empty response bodies
      super
    rescue HyperResource::ResponseError
      nil
    end
    alias_method :destroy, :delete

    def self.basename
      name.split('::').last.downcase.pluralize
    end

    def self.collection_url
      config = Aptible::Api.configuration
      config.root_url.chomp('/') + "/#{basename}"
    end

    def self.all(options = {})
      resource = find_by_url(collection_url, options)
      return [] unless resource
      resource.send(basename).entries
    end

    def self.find(id, options = {})
      find_by_url("#{collection_url}/#{id}", options)
    end

    def self.find_by_url(url, options = {})
      # REVIEW: Should exception be raised if return type mismatch?
      new(options).find_by_url(url)
    rescue HyperResource::ClientError => e
      if e.response.status == 404
        return nil
      else
        raise e
      end
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

    def self.belongs_to(relation)
      define_method relation do
        get unless loaded
        if (memoized = instance_variable_get("@#{relation}"))
          memoized
        elsif links[relation]
          instance_variable_set("@#{relation}", links[relation].get)
        end
      end
    end

    # rubocop:disable PredicateName
    def self.has_one(relation)
      # Better than class << self + alias_method?
      belongs_to(relation)
    end
    # rubocop:enable PredicateName

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

    def update(params)
      params_array = params.map do |key, value|
        value.is_a?(HyperResource) ? [key, value.href] : [key, value]
      end
      super(Hash[params_array])
    end

    # NOTE: The following does not update the object in-place
    def reload
      self.class.find_by_url(href, headers: headers)
    end
  end
end

require 'aptible/api/account'
require 'aptible/api/app'
require 'aptible/api/configuration'
require 'aptible/api/container'
require 'aptible/api/database'
require 'aptible/api/disk'
require 'aptible/api/image'
require 'aptible/api/operation'
require 'aptible/api/permission'
require 'aptible/api/release'
require 'aptible/api/service'
require 'aptible/api/vhost'
