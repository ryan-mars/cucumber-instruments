require 'spec_helper'

describe "Cucumber::Instruments" do
  subject { Cucumber::Instruments }
  
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
      it "overrides the inferred app bundle path" do
        pending 
        # relative_bundle_path = "../../Build/Products/Release-iphonesimulator/FixtureApp.app"
        # config.app_bundle_path = File.expand_path(relative_bundle_path,__dir__)
      end
    end

    context 'when app_bundle_path is not specified' do
      it "infers the app bundle path from xcodebuild settings" do
        pending 
      end
    end

    context 'xcodebuild' do
      subject(:xcodebuild) { Cucumber::Instruments.xcodebuild }
      it { should respond_to(:xcodeproj) } 
      it { should respond_to(:xcworkspace) }
      it { should respond_to(:scheme) }
      it { should respond_to(:sdk) }
      it { should respond_to(:configuration) }
    end # xcodebuild 
  end # configuration 
  
end 