# ![](https://raw.github.com/aptible/straptible/master/lib/straptible/rails/templates/public.api/icon-60px.png) Aptible::Api

[![Gem Version](https://badge.fury.io/rb/aptible-api.png)](https://rubygems.org/gems/aptible-api)
[![Build Status](https://travis-ci.org/aptible/aptible-api-ruby.png?branch=master)](https://travis-ci.org/aptible/aptible-api-ruby)
[![Dependency Status](https://gemnasium.com/aptible/aptible-api-ruby.png)](https://gemnasium.com/aptible/aptible-api-ruby)

Ruby client for [api.aptible.com](https://api.aptible.com/). Aptible's API server is built on top of [HAL+JSON](http://tools.ietf.org/html/draft-kelly-json-hal-06), and so this client is just a thin layer on top of the [HyperResource](https://github.com/gamache/hyperresource) gem.

## Installation

Add the following lines to your application's Gemfile.

    gem 'aptible-api'
    gem 'hyperresource', github: 'fancyremarker/hyperresource', branch: 'aptible'

The forked version of the HyperResource gem is necessary until [gamache/hyperresource#19](https://github.com/gamache/hyperresource/pull/19) is merged.

And then run `bundle install`.

## Usage

First, get a token:

```ruby
token = Aptible::Auth::Token.new(email: 'user0@example.com', password: 'password')
```

Then, initialize a client:
```ruby
api = Aptible::Api::Client.new(token: token)
```

From here, you can interact with the Authorization API however you wish:

```ruby
api.get.clients.count
# => 4
api.get.clients.first.name
# => "Client 0"
client = api.get.clients.create(name: 'Dogeclient')
client.href
# => "http://localhost:4000/clients/60765b69-ffd8-4762-b9d2-96354ddb16f9"
```

## Configuration

| Parameter | Description | Default |
| --------- | ----------- | --------------- |
| `root_url` | Root URL of the authorization server | `https://api.aptible.com` |

To point the client at a different authorization server (e.g., during development), add the following to your application's initializers:

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
