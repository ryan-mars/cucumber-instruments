require 'bundler/setup'
Bundler.setup

require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
	require 'rspec'
  require_relative 'cucumber_instruments_helpers'

	RSpec.configure do |config|
    config.include(CucumberInstrumentsHelpers)

    config.filter_run_excluding :deprecated => true
	  config.expect_with :rspec do |c|
	    c.syntax = :expect
	  end
	end
end

Spork.each_run do
  require 'cucumber/instruments'
  require 'uiautomation'
end