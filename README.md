[![Code Climate](https://codeclimate.com/github/cucumber-instruments/cucumber-instruments.png)](https://codeclimate.com/github/cucumber-instruments/cucumber-instruments)
# Cucumber::Instruments

This is a work in progress example of driving iOS apps with [Cucumber](http://cukes.info/). It leverages a novel driver implementation that can be found at [https://github.com/cucumber-instruments/instruments-server](https://codeclimate.com/github/cucumber-instruments/instruments-server)

To get an idea of what's going on have a look in the `features/` directory. It's a bit meta. In there you'll find a Cucumber feature which tests our idea, that is "create Cucumber features for an iOS project and run them successfully". If you want to see what how your project might look like if you were using it run Cucumber as defined in the "**For now**" section of this readme and then take a look in the `tmp/aruba` directory. You can `bundle exec cucumber` in that directory and watch a project run first hand.

## Why
I'm not a full time programmer anymore but I still love to code. I'm actually an Agile coach. I became one because I care about programmers, I believe the way we manage software in our industry is demonstrably insane. My passion is to better the work lives of the most amazing people I know (developers).

Cucumber doesn't provide obvious beneft to most developers. I have found it to be an immensely valuable tool for communicating with stakeholders. Cucumber sets crystal clear expectations for what the software will do and then makes those expectations executable tests. This single tool has the potential to eliminate a considerable amount of heartache on software projects, and eliminating developer heartache is what I'm all about.

### Special thanks
Special thanks to [@fpotter](https://github.com/fpotter) for the original hack on Instruments which I repurposed for the driver.
Thanks to [@weyus](https://github.com/weyus) [@subdigital](https://github.com/subdigital) [@scottburton11](https://github.com/scottburton11) and [@rssvihla](https://github.com/rssvihla) for their valuable guidance.

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
