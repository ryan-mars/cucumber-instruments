describe Cucumber::Instruments::Server do 
	subject { Cucumber::Instruments::Server }
	
	it { should respond_to(:start) }
	it { should respond_to(:stop) } 	
	it { should respond_to(:running?) } 

	it "does not leave zombies" do
		`killall -9 instruments`
		Cucumber::Instruments::Server.start 
		Cucumber::Instruments::Server.stop 
		instruments_path = `xcode-select -p`.delete!("\n") + '/usr/bin/instruments'
		expect(`ps`).to_not match(/#{instruments_path}/)
	end

	context "when running" do
		before do
			Cucumber::Instruments::Server.start
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
			expect(`ps`).to match(/^#{pid}.+#{instruments_path}/)
		end	

		it "#stop stops instruments" do 
			instruments_path = `xcode-select -p`.delete!("\n") + '/usr/bin/instruments'
			pid = Cucumber::Instruments::Server.pid	

			Cucumber::Instruments::Server.stop 
			expect(`ps`).not_to match(/^#{pid}.+#{instruments_path}/)
		end 
	end

	context "when not running" do
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
