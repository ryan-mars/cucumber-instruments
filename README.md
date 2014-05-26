[![Code Climate](https://codeclimate.com/github/cucumber-instruments/cucumber-instruments.png)](https://codeclimate.com/github/cucumber-instruments/cucumber-instruments)
# Cucumber::Instruments

TODO: Write a gem description

## Installation

Install it

    $ sudo gem install cucumber-instruments

### Bundler 

Alternatively if you're using Bundler you can add this line to your application's Gemfile:

    gem 'cucumber-instruments'

And then execute:

    $ bundle

## Usage

Generate a basic features directory

    $ cucumber-instruments get-started

If Cucumber-Instruments was unable to detect your application bundle then you'll need to update the path to your app bundle like so:

    # features/support/env.rb
    Cucumber::Instruments.configure do |config|
      config.app_bundle_path = "~/path/to/your.app"
    end

Test drive your app

    $ cucumber

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request