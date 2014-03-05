# Cucumber::Instruments

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'cucumber-instruments'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cucumber-instruments

## Usage

Generate a basic features directory

    $ cucumber-instruments generate

Update the path to your app bundle like so:

    # features/support/env.rb
    APP_BUNDLE = ~/path/to/your.app

Test drive your app

    $ cucumber

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
