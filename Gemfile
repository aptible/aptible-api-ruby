source 'https://rubygems.org'

gem 'pry',
    git: 'https://github.com/fancyremarker/pry.git',
    branch: 'aptible'

# ActiveSupport version depends on Ruby version for compatibility
if RUBY_VERSION < '2.2'
  gem 'activesupport', '~> 4.0'
else
  gem 'activesupport', '>= 5.2'
end

# Specify your gem's dependencies in aptible-api.gemspec
gemspec
