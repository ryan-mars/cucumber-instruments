require 'spec_helper'

describe UIATarget do
  describe ".localTarget" do
    it "returns an instance of UIAChain" do
      expect(UIATarget.localTarget.class).to eq(UIAChain)
    end 

    it "has the right chain" do 
      expect(UIATarget.localTarget.inspect).to eq("UIATarget.localTarget();")
    end 
  end

  it "does not emit on the wrong functions" do 
    pending 
  end 

end

describe UIAChain do
  it "has an array of messages" do
    expect(UIAChain.new.this.then.that.instance_variable_get(:@messages)).to eq(["this()","then()","that()"])
  end

  it "defaults to an empty array" do 
    expect(UIAChain.new.instance_variable_get(:@messages)).to eq([])
  end 

  it "does not mutate the message chain when passed by reference" do 
    object1 = UIAChain.new 
    object2 = object1.this.then.that 
    object3 = object2.fizz.buzz
    expect(object2.instance_variable_get(:@messages)).to eq(["this()","then()","that()"])
  end

  it "handles array index functions" do 
    chain = UIAChain.new.tableViews[3].cells[0]
    expect(chain.instance_variable_get(:@messages)).to eq(["tableViews()[3]","cells()[0]"])
  end 

  it "formats JavaScript properly" do 
    chain = UIATarget.localTarget.frontMostApp.mainWindow.tableViews[0].cells
    javascript = "UIATarget.localTarget().frontMostApp().mainWindow().tableViews()[0].cells();"
    expect(chain.inspect).to eq(javascript)
  end 

  describe "#count" do
    it "sends to the server" do
      expect("this").to eq("that")
    end
  end

  it "sends JavaScript commands to the server" do 
    pending 
  end 

  it "returns ruby objects from the server" do 
    pending 
  end 
end