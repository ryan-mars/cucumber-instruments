# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cucumber/instruments/version'

Gem::Specification.new do |spec|
  spec.name          = "cucumber-instruments"
  spec.version       = Cucumber::Instruments::VERSION
  spec.authors       = ["Ryan Marsh"]
  spec.email         = ["ryan.marsh@mac.com"]
  spec.description   = %q{Cucumber driver for iOS UIAutomation}
  spec.summary       = %q{Cucumber-Instruments is the easiest way to do Cucumber style testing of iOS apps through the power of Instruments and UIAutomation.}
  spec.homepage      = "https://github.com/cucumber-instruments/cucumber-instruments"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "cucumber"            # Obvs
  spec.add_dependency "rspec-expectations"  # For your steps
  spec.add_dependency "childprocess"        # Managing instruments process
  spec.add_dependency "xcpretty"            # Clean build output
  spec.add_dependency "faraday"            # HTTP

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "aruba"                     # Testing cucumber with cucumber
  spec.add_development_dependency "thor"                      # Probably should be runtime dep
  spec.add_development_dependency "rspec"                     # Specs & Cucumber
  spec.add_development_dependency "rspec-mocks"               # Might remove
  spec.add_development_dependency "guard-rspec"               # Maintain mental state of "Flow"
  spec.add_development_dependency "guard-cucumber"            # Same
  spec.add_development_dependency "guard-spork"               # Same
  spec.add_development_dependency "terminal-notifier-guard"   # Same
  spec.add_development_dependency "rspec-nc"                  # RSpec notification center
  spec.add_development_dependency "awesome_print"             # Beautifies IRB
end
