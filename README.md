# ![](https://raw.github.com/aptible/straptible/master/lib/straptible/rails/templates/public.api/icon-60px.png) Aptible::Api

[![Gem Version](https://badge.fury.io/rb/aptible-api.png)](https://rubygems.org/gems/aptible-api)
[![Build Status](https://travis-ci.org/aptible/aptible-api-ruby.png?branch=master)](https://travis-ci.org/aptible/aptible-api-ruby)
[![Dependency Status](https://gemnasium.com/aptible/aptible-api-ruby.png)](https://gemnasium.com/aptible/aptible-api-ruby)

Ruby client for [api.aptible.com](https://api.aptible.com/). Aptible's API server is built on top of [HAL+JSON](http://tools.ietf.org/html/draft-kelly-json-hal-06), and so this client is just a thin layer on top of the [HyperResource](https://github.com/gamache/hyperresource) gem.

## Installation

Add the following lines to your application's Gemfile.

    gem 'aptible-api'

And then run `bundle install`.

*Note:* A forked version of the HyperResource gem (`hyperresource-aptible`) is necessary until [gamache/hyperresource#22](https://github.com/gamache/hyperresource/pull/22) and [gamache/hyperresource#23](https://github.com/gamache/hyperresource/pull/23) are merged.

## Usage

First, get a token:

```ruby
token = Aptible::Auth::Token.create(email: 'user0@example.com', password: 'password')
```

From here, you can interact with the Authorization API however you wish:

```ruby
api = Aptible::Api.new(token: token)
account = api.accounts.first
account.apps.count
# => 4
account.apps.first.handle
# => "foodle"
newapp = account.create_app(handle: 'bardle')
newapp.href
# => "http://localhost:4001/apps/7"
```

## Configuration

| Parameter | Description | Default |
| --------- | ----------- | --------------- |
| `root_url` | Root URL of the API server | `ENV['APTIBLE_API_ROOT_URL']` or [https://api.aptible.com](https://api.aptible.com) |

To point the client at a different API server (e.g., during development), add the following to your application's initializers (or set the `APTIBLE_API_ROOT_URL` environment variable):

```ruby
Aptible::Api.configure do |config|
  config.root_url = 'http://some.other.url'
end
```

## Contributing

1. Fork the project.
1. Commit your changes, with specs.
1. Ensure that your code passes specs (`rake spec`) and meets Aptible's Ruby style guide (`rake rubocop`).
1. Create a new pull request on GitHub.

## Copyright and License

MIT License, see [LICENSE](LICENSE.md) for details.

Copyright (c) 2013 [Aptible](https://www.aptible.com), Frank Macreery, and contributors.
