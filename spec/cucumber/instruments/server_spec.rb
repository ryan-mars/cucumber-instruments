require 'cucumber/instruments/server'

describe "Cucumber::Instruments::Server" do 
	subject { Cucumber::Instruments::Server }
	
	it { should respond_to(:start) }

	context "running" do
		before do
			`killall -9 instruments`
			Cucumber::Instruments::Server.start
		end

		it "is #running?" do
			expect(subject.running?).to be_true
		end 

		it "pid is not nil" do
			expect(subject.pid).to_not be_nil
		end 

		it "pid is a Fixnum" do
			expect(subject.pid).to be_a(Fixnum)
		end 

		it "instruments will be running" do
			instruments_path = `xcode-select -p`.delete!("\n") + '/usr/bin/instruments'
			pid = Cucumber::Instruments::Server.pid	
			expect(`ps`).to match(/^#{pid}.+#{instruments_path}/)
		end	
	end

	context "not running" do
		it "has a nil pid" do
			Cucumber::Instruments::Server.stop
			expect(Cucumber::Instruments::Server.pid).to be_nil
		end
	end 
	
end