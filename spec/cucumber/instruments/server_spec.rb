require 'spec_helper'

describe "Cucumber::Instruments::Server" do	
		instruments_path = `xcode-select -p`.chomp + '/usr/bin/instruments'
		fixture_app_base_path = "../../fixtures/FixtureApp"
		fixture_app_bundle_path = File.expand_path("#{fixture_app_base_path}/Build/Products/Release-iphonesimulator/FixtureApp.app", __dir__) 

		subject { Cucumber::Instruments::Server }
		
		it { should respond_to(:start) }
		it { should respond_to(:stop) } 	
		it { should respond_to(:running?) } 
		it { should respond_to(:inherit_io) } 

		it "does not leave zombies" do
			killall_instruments	#clean up to insure we don't false fail 
			Cucumber::Instruments::Server.start(fixture_app_bundle_path) 
			Cucumber::Instruments::Server.stop 
			expect(`ps`).to_not match(/#{instruments_path}/)
		end

		context "when started" do
			before(:all) do
				Cucumber::Instruments::Server.start(fixture_app_bundle_path) 
			end

			it "returns true for running?" do
				expect(subject.running?).to be_true
			end 

			it "pid is not nil" do
				expect(subject.pid).to_not be_nil
			end 

			it "pid is a Fixnum" do
				expect(subject.pid).to be_a(Fixnum)
			end 

			it "pid is > 0" do 
				expect(subject.pid).to be > 0
			end 

			it "instruments will be running" do
				pid = Cucumber::Instruments::Server.pid	
				expect(`ps`).to match(/^.?#{pid}.+#{instruments_path}/)
			end	

			it "starts a .app in the simulator" do
				pid = Cucumber::Instruments::Server.pid	
				expect(`ps`).to match(/^.?#{pid}.+#{instruments_path}.+#{fixture_app_bundle_path}/)
			end 

			it "#stop stops instruments" do 
				pid = Cucumber::Instruments::Server.pid	
				Cucumber::Instruments::Server.stop 
				expect(`ps`).not_to match(/^.?#{pid}.+#{instruments_path}/)
			end 
		end

		context "when not started" do
			before(:all) do
				killall_instruments
			end

			it "has a nil pid" do
				expect(Cucumber::Instruments::Server.pid).to be_nil
			end

			it "returns false for running?" do
				expect(subject.running?).to_not be_true 
			end

			it "does not throw an error for #stop" do 
				Cucumber::Instruments::Server.stop
			end 
		end 
end