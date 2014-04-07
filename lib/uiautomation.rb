#require 'uiautomation/uiatarget'

class UIAChain
  def initialize messages = []
    @messages = messages
  end 

  def [] index
    last_array = @messages.size - 1
    @messages[last_array] = @messages[last_array] + '[' + index.to_s +  ']'
    UIAChain.new @messages.dup
  end

  def method_missing m , *args, &block
    UIAChain.new @messages.dup << "#{m}()"
  end

  def respond_to_missing? method_name, include_private = false
    true
  end

  def count
    puts "FIXME: SEND TO SERVER #{@messages.join(".")};"
  end 

  def inspect 
    "#{@messages.join(".")};"
  end 
end 

class UIATarget < UIAChain
  class << self 
    def localTarget 
      UIAChain.new ["UIATarget", "localTarget()"]
    end 
  end 
end