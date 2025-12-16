source 'https://rubygems.org'

# ActiveSupport version depends on Ruby version for compatibility
# ActiveSupport 4.x is incompatible with Ruby 2.7+ (BigDecimal.new removed)
if RUBY_VERSION < '2.7'
  gem 'activesupport', '~> 4.0'
else
  gem 'activesupport', '>= 5.2'
end
gem "irb", "~> 1.1"

# Specify your gem's dependencies in aptible-api.gemspec
gemspec
