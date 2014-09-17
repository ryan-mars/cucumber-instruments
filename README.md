[![Code Climate](https://codeclimate.com/github/cucumber-instruments/cucumber-instruments.png)](https://codeclimate.com/github/cucumber-instruments/cucumber-instruments)
# Cucumber::Instruments

This is a work in progress example of driving iOS apps with Cucumber. It leverages a novel driver implementation that can be found at https://github.com/cucumber-instruments/instruments-server

To get an idea of what's going on have a look in the `features/` directory. It's a bit meta. In there you'll find a Cucumber feature which tests our idea, that is "create cucumber features for an iOS project and run them successfully". If you want to see what an actual project might look like, run cucumber as defined in the "For now" section of this readme and then take a look in the `tmp/aruba` directory. You can `bundle exec cucumber` in that directory and watch a project run first hand.

## Vision

Ideally when it is finished you would be able to set up your iOS project for Cucumber automation with a mere 
    
    $ sudo gem install cucumber-instruments

Generate a basic features directory

    $ cucumber-instruments get-started    

If Cucumber-Instruments was unable to detect your application bundle then you'd need to update the path to your app bundle like so:

    # features/support/env.rb
    Cucumber::Instruments.configure do |config|
      config.app_bundle_path = "~/path/to/your.app"
    end

Then simply test drive (ATDD) your app

    $ cucumber

## For now

### Set up your development environment

For the time being you'll have to change one Xcode setting for the tests to pass if you decide modify any of the fixtures.
    ![Set Xcode locations](http://i.imgur.com/SfwambO)

### Run the tests

    $ bundle exec rspec
    $ bundle exec cucumber

### Hack

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Write your code and tests (not necessarily in that order)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request