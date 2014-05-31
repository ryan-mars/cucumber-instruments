require 'spec_helper'

describe Xcodebuild do

  subject :subject do
    buildconfig = XcodebuildConfig.new
    buildconfig.xcodeproj = File.expand_path("../../fixtures/FixtureApp/FixtureApp.xcodeproj",__dir__)
    buildconfig.scheme = "FixtureApp"
    buildconfig.sdk = "iphonesimulator"
    buildconfig.configuration = "Release"

    Xcodebuild.new(buildconfig)
  end

  it { should respond_to(:build_settings) }
  it { should respond_to(:app_bundle_path) }

  it "provides the path to our compiled app" do
    # FIXME: this should use a fixture file as the output from running xcodebuild -showBuildSettings
    relative_bundle_path = "../../fixtures/FixtureApp/Build/Products/Release-iphonesimulator/FixtureApp.app"
    proper_app_bundle_path = File.expand_path(relative_bundle_path,__dir__)
    expect(subject.app_bundle_path).to eq(proper_app_bundle_path)
  end

  it "returns a hash of xcode build settings" do
    # FIXME: this should use a fixture file as the output from running xcodebuild -showBuildSettings
    expected_value = File.expand_path("../../fixtures/FixtureApp/Build/Products/Release-iphonesimulator",__dir__)
    expect(subject.build_settings["CONFIGURATION_BUILD_DIR"]).to eq(expected_value)
  end

end