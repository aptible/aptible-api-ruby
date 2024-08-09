# encoding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'English'
require 'aptible/api/version'

Gem::Specification.new do |spec|
  spec.name          = 'aptible-api'
  spec.version       = Aptible::Api::VERSION
  spec.authors       = ['Frank Macreery']
  spec.email         = ['frank@macreery.com']
  spec.description   = 'Ruby client for api.aptible.com'
  spec.summary       = 'Ruby client for api.aptible.com'
  spec.homepage      = 'https://github.com/aptible/aptible-api-ruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($RS)
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ['lib']

  spec.add_dependency 'aptible-auth'
  spec.add_dependency 'aptible-resource'
  spec.add_dependency 'gem_config'
  spec.add_dependency 'multipart-post', '<2.2.0'

  spec.add_development_dependency 'activesupport'
  spec.add_development_dependency 'aptible-tasks', '>= 0.2.0'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'foreman'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 12.3.3'
  spec.add_development_dependency 'rspec', '~> 3.9.0'
  spec.add_development_dependency 'rspec-its', '~> 1.3.0'
end
