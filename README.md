# rack-config_env

[![Build Status](https://secure.travis-ci.org/sonots/rack-config_env.png?branch=master)](http://travis-ci.org/sonots/rack-config_env)
[![Coverage Status](https://coveralls.io/repos/sonots/rack-config_env/badge.png?branch=master)](https://coveralls.io/r/sonots/rack-config_env?branch=master)

A rack middleware to configure rack env

## Installation

Add the following to your `Gemfile`:

```ruby
gem 'rack-config_env'
```

And then execute:

```plain
$ bundle
```

## How to Use

This gem provides a rack middleware `Rack::ConfigEnv` which enables to configure rack's env. 

### Rails

```ruby
# config/application.rb
require 'logger'
require 'rack-config_env'

class Application < Rails::Application
  config.middleware.insert_after(0, Rack::ConfigEnv, {
    'action_dispatch.logger' => Logger.new(STDOUT)
  })
end
```

Middleware check. 

```bash
bundle exec rake middleware
```

### Sinatra

```ruby
# config.ru
require 'rack-config_env'

use Rack::ConfigEnv, { 'rack.errors' => STDERR }
run App
```

## ChangeLog

See [CHANGELOG.md](CHANGELOG.md) for details.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new [Pull Request](../../pull/new/master)

## Copyright

Copyright (c) 2014 Naotoshi Seo. See [LICENSE.txt](LICENSE.txt) for details.
