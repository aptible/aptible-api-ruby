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
  spec.description   = %q(Ruby client for api.aptible.com)
  spec.summary       = %q(Ruby client for api.aptible.com)
  spec.homepage      = 'https://github.com/aptible/aptible-api'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($RS)
  spec.test_files    = spec.files.grep(/^spec\//)
  spec.require_paths = ['lib']

  spec.add_dependency 'aptible-resource', '>= 0.2.1'
  spec.add_dependency 'gem_config'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'aptible-tasks', '>= 0.2.0'
  spec.add_development_dependency 'aptible-auth', '>= 0.5.0'
  spec.add_development_dependency 'activesupport'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 2.0'
  spec.add_development_dependency 'foreman'
  spec.add_development_dependency 'pry'
end
