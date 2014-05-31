require 'spec_helper'

describe "Cucumber::Instruments" do
  subject(:cucumber_instruments) { Cucumber::Instruments }

  it { should respond_to(:configure) }
  it { should respond_to(:inherit_io) }   
  it { should respond_to(:app_bundle_path) }
  
  it "yields self with #configure" do
    expect { |b| cucumber_instruments.configure(&b) }.to yield_control 
  end
end 