describe "Cucumber::Instruments::Server" do
		fixture_app_path = File.expand_path("../../fixtures/FixtureApp/Build/Products/Debug-iphonesimulator/FixtureApp.app", __dir__) 

		after(:each) do
		  `killall -9 instruments`
		end

		subject { Cucumber::Instruments::Server }
		
		it { should respond_to(:start) }
		it { should respond_to(:stop) } 	
		it { should respond_to(:running?) } 

		it "does not leave zombies" do
			`killall -9 instruments`
			Cucumber::Instruments::Server.start fixture_app_path
			Cucumber::Instruments::Server.stop 
			instruments_path = `xcode-select -p`.delete!("\n") + '/usr/bin/instruments'
			expect(`ps`).to_not match(/#{instruments_path}/)
		end

		context 'when started with no app bundle path' do
			it "uses APP_BUNDLE_PATH from environment" do 
				#pending "refactor to use Cucumber::Instruments.app_bundle_path"
				ENV['APP_BUNDLE_PATH'] = File.expand_path("../../fixtures/FixtureApp/Build/Products/Debug-iphonesimulator/FixtureApp.app",__dir__)
				pending "prove that it fetches APP_BUNDLE_PATH from the environment instead"
			end

			context 'when APP_BUNDLE_PATH is not set' do
				it "it raises an error" do 
					#pending "refactor to use Cucumber::Instruments.app_bundle_path"
					ENV['APP_BUNDLE_PATH'] = nil
					pending "need to figure out what error it should raise"
				end 
			end
		end

		context "when started with an app bundle path" do

			before do
				puts "fixture_app_path = #{fixture_app_path}"
				Cucumber::Instruments::Server.start fixture_app_path
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
				instruments_path = `xcode-select -p`.delete!("\n") + '/usr/bin/instruments'
				pid = Cucumber::Instruments::Server.pid	
				expect(`ps`).to match(/^.?#{pid}.+#{instruments_path}/)
			end	

			it "starts a .app in the simulator" do
				pid = Cucumber::Instruments::Server.pid	
				instruments_path = `xcode-select -p`.delete!("\n") + '/usr/bin/instruments' 
				expect(`ps`).to match(/^.?#{pid}.+#{instruments_path}.+#{fixture_app_path}/)
			end 

			it "#stop stops instruments" do 
				instruments_path = `xcode-select -p`.delete!("\n") + '/usr/bin/instruments'
				pid = Cucumber::Instruments::Server.pid	
				Cucumber::Instruments::Server.stop 
				expect(`ps`).not_to match(/^.?#{pid}.+#{instruments_path}/)
			end 
		end

		context "when not started" do
			before do
				Cucumber::Instruments::Server.stop
				`killall -9 instruments`
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