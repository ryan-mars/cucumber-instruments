require 'spec_helper'

describe XcodebuildConfig do
  it { should respond_to(:xcodeproj) }
  it { should respond_to(:xcworkspace) }
  it { should respond_to(:scheme) }
  it { should respond_to(:sdk) }
  it { should respond_to(:configuration) }
  it { should respond_to(:env) }
end