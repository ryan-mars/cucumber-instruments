describe "Cucumber::Instruments" do
  subject { Cucumber::Instruments }

  it { should respond_to(:configure) }
  it { should respond_to(:inherit_io) }   
  it { should respond_to(:app_bundle_path) }   
  
  it "yields self with #configure" do
    expect { |b| Cucumber::Instruments.configure(&b) }.to yield_control 
  end

  it "sets up the world" do 
    pending "need to setup cucumber world object with our DSL"
  end 

  it "defaults #inherit_io to false" do 
    pending "implement this"
  end 

  it "has a before hook that launches the correct simulator" do 
    pending "not sure if we can re-run a scenario multiple times might have to use Background"
    # Before do |scenario|
    #   scenario.source_tag_names.each do |tag|
    #     #prepare to run the scenario more than once for each tag
    #   end
    # end 
  end 

end 