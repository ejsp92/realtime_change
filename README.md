# RealtimeChange

Gem for realtime client-server communication. Created to work with [communication-socket](https://github.com/emesonsantana/communication-socket).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'realtime_change'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install realtime_change

## Usage

Basic Configuration:
```ruby
# Configure
RealtimeChange.setup do |config|
  config.redis = Redis.new "redis://localhost:6379"
end

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend RealtimeChange::Model
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/realtime_change. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

