require 'childprocess'

module Cucumber
	module Instruments
		class Server 
			@@pid = nil 
			@@process 

			def self.running?
				return @@running 
			end 			

			def self.start
				@@process = ChildProcess.build('/Users/ryan/code/cucumber-instruments/instruments-server/build/instruments',
										'-w iPhone Retina (4-inch) - Simulator - iOS 7.1','-t','/Applications/Xcode.app/Contents/Developer/../Applications/Instruments.app/Contents/PlugIns/AutomationInstrument.bundle/Contents/Resources/Automation.tracetemplate',
										'/Users/ryan/code/cucumber-instruments/instruments-server/build/TestApp.app',
										'-e', 'UIASCRIPT', 
										'/Users/ryan/code/cucumber-instruments/instruments-server/test.js')
				@@process.detach = true
				@@process.start
				sleep 10
				@@running = true
			end 
			
			def self.pid
				return @@process.pid
			end 

			def self.stop
				@@pid = nil
			end 

		end
	end
end