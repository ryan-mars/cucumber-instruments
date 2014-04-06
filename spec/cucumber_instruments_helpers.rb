module CucumberInstrumentsHelpers 
  def killall_instruments 
    `killall -9 instruments 2>&1`
  end 
end 
