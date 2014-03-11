# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cucumber/instruments/version'

Gem::Specification.new do |spec|
  spec.name          = "cucumber-instruments"
  spec.version       = Cucumber::Instruments::VERSION
  spec.authors       = ["Ryan Marsh"]
  spec.email         = ["ryan.marsh@mac.com"]
  spec.description   = %q{Cucumber for iOS UIAutomation testing}
  spec.summary       = %q{UIA-Cucumber is the easiest way to do style Cucumber testing of iOS apps through the power of Instruments and UIAutomation.}
  spec.homepage      = "https://github.com/cucumber-instruments/cucumber-instruments"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "cucumber"
  spec.add_dependency "rspec-expectations"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "aruba"
  spec.add_development_dependency "thor"
  spec.add_development_dependency "rspec"
end
