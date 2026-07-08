source 'https://rubygems.org'

# ActiveSupport version depends on Ruby version for compatibility
# ActiveSupport 4.x is incompatible with Ruby 2.7+ (BigDecimal.new removed)
if RUBY_VERSION < '2.7'
  gem 'activesupport', '~> 4.0'
else
  gem 'activesupport', '>= 5.2'
end
# Rack 3.x requires Ruby 2.6+ (Enumerable#to_h with block)
gem 'rack', '< 3' if RUBY_VERSION < '2.6'
gem "irb", "~> 1.1"

# Specify your gem's dependencies in aptible-api.gemspec
gemspec
