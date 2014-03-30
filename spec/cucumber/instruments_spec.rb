describe "Cucumber::Instruments" do
  subject { Cucumber::Instruments }

  it "sets up the world" do 
    pending "need to setup cucumber world object with our DSL"
  end 

  context 'configuration' do
    it { should respond_to(:configure) }
    it { should respond_to(:inherit_io) }   
    it { should respond_to(:app_bundle_path) }   
    
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
  end
  
  it "has a before hook that launches the correct simulator" do 
    pending "not sure if we can re-run a scenario multiple times might have to use Background"
    # Before do |scenario|
    #   scenario.source_tag_names.each do |tag|
    #     #prepare to run the scenario more than once for each tag
    #   end
    # end 
    # Around('@ios7','@ios6') do |scenario, block|
    #   simulator = :ios7
    #   block.call
    #   simulator = :ios6
    #   block.call
    # end
  end 

end 