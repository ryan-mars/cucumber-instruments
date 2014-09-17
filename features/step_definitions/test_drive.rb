module CucumberInstrumentsHelper
  def install_cucumber_instruments
    gem "cucumber-instruments", :path => "#{File.expand_path('.')}"
  end

  def gem(name, options)
    line = %{gem "#{name}", #{options.inspect}\n}
    append_to_file('Gemfile', line)
  end
end

World(CucumberInstrumentsHelper)

Given(/^I have installed cucumber\-instruments$/) do
  install_cucumber_instruments
end

Given(/^I have an iOS project "(.*?)"$/) do |project_name|
  FileUtils.cp_r "spec/fixtures/#{project_name}/.", current_dir
end

Given(/^I have configured Cucumber\-Instruments to test "(.*?)"$/) do |project_name|
  steps %Q{
  And I write to "features/support/env.rb" with:
  """
  require 'cucumber/instruments'
  require 'cucumber/instruments/steps'
  require 'uiautomation'

  buildconfig = XcodebuildConfig.new
  buildconfig.xcodeproj = "#{project_name}.xcodeproj"
  buildconfig.scheme = "#{project_name}"
  buildconfig.sdk = "iphonesimulator"
  buildconfig.configuration = "Release"
  app_bundle_path = Xcodebuild.new(buildconfig).app_bundle_path

  Cucumber::Instruments.configure do |config|
    config.inherit_io = true
    config.app_bundle_path = app_bundle_path
  end
  """
  }
end
