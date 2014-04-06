require 'spec_helper'

describe "Cucumber::Instruments" do
  subject { Cucumber::Instruments }

  xcodeproj_path = File.expand_path("../fixtures/FixtureApp/FixtureApp.xcodeproj",__dir__)
  Cucumber::Instruments.configure do |config|
    config.inherit_io = true
    config.xcodebuild.xcodeproj = xcodeproj_path
    config.xcodebuild.scheme = "FixtureApp"
    config.xcodebuild.sdk = "iphonesimulator"
    config.xcodebuild.configuration = "Release"
  end

  context 'configuration' do
    it { should respond_to(:configure) }
    it { should respond_to(:inherit_io) }   
    it { should respond_to(:app_bundle_path) }   
    it { should respond_to(:xcodebuild) }   
    
    it "yields self with #configure" do
      expect { |b| Cucumber::Instruments.configure(&b) }.to yield_control 
    end

    it "defaults #inherit_io to false" do 
      pending "implement this"
    end 

    context 'when app_bundle_path is specified' do
      it "it useses the specified app bundle path" do
        pending 
        # relative_bundle_path = "../../Build/Products/Release-iphonesimulator/FixtureApp.app"
        # config.app_bundle_path = File.expand_path(relative_bundle_path,__dir__)
      end
    end

    context 'when app_bundle_path is not specified' do
      it "#app_bundle_path uses xcodebuild settings" do
        relative_bundle_path = "../fixtures/FixtureApp/Build/Products/Release-iphonesimulator/FixtureApp.app"
        proper_app_bundle_path = File.expand_path(relative_bundle_path,__dir__)
        expect(Cucumber::Instruments.app_bundle_path).to eq(proper_app_bundle_path)
      end
    end

    context 'xcodebuild' do
      subject(:xcodebuild) { Cucumber::Instruments.xcodebuild }
      it { should respond_to(:xcodeproj) } 
      it { should respond_to(:xcworkspace) }
      it { should respond_to(:scheme) }
      it { should respond_to(:sdk) }
      it { should respond_to(:configuration) }
      it { should respond_to(:settings) }
      it { should respond_to(:env) }

      context '#env' do
        it "has an array of env vars" do
          pending 
        end   

        it "sets the vars when xcodebuild is run" do 
          pending 
        end 
      end
      
      context '#settings' do
        it "returns a hash of xcode build settings" do
          # FIXME: this should use a fixture file as the output from running xcodebuild 
          expected_value = "/Users/ryan/Code/cucumber-instruments/cucumber-instruments/spec/fixtures/FixtureApp/Build/Products/Release-iphonesimulator"
          expect(xcodebuild.settings["CONFIGURATION_BUILD_DIR"]).to eq(expected_value)
        end
      end
    end # xcodebuild 
  end # configuration 
  
end 