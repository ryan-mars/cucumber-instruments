module CucumberInstrumentsHelpers
  def killall_instruments
    `killall -9 instruments 2>&1`
  end

  def spike
    pending "TODO: Spike on this"
  end
end
