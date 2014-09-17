require 'spec_helper'

module Cucumber
  describe Instruments do
    it { should respond_to(:configure) }
    it { should respond_to(:launch) }
    it { should respond_to(:app_bundle_path)}

    it "yields self with #configure" do
      expect { |b| subject.configure(&b) }.to yield_control
    end
  end
end