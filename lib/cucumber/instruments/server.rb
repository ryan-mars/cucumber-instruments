require 'childprocess'
require 'tmpdir'

module Cucumber
	module Instruments
		class Server 
			@@pid = nil 
			@@process = nil

			def self.running?
				return @@running 
			end 			

			def self.start(app_bundle_path = ENV['APP_BUNDLE_PATH'])
				@@process = ChildProcess.build("/Applications/Xcode.app/Contents/Developer/usr/bin/instruments",
										"-t",
										"/Applications/Xcode.app/Contents/Developer/../Applications/Instruments.app/Contents/PlugIns/AutomationInstrument.bundle/Contents/Resources/Automation.tracetemplate",
										"-w", "iPhone Retina (4-inch) - Simulator - iOS 7.1",
				 						app_bundle_path,
				 						"-e", "UIASCRIPT", 
				 						"/Users/ryan/code/cucumber-instruments/instruments-server/test.js" )
				
				lib_path = "/Users/ryan/Dropbox/Code/cucumber-instruments/cucumber-instruments/bin"
				@@process.environment["DYLD_INSERT_LIBRARIES"] = "#{lib_path}/InstrumentsShim.dylib"
				@@process.environment["LIB_PATH"] = "#{lib_path}"
				@@process.io.inherit!
				@@process.cwd = Dir.mktmpdir("cucumber-instruments",Dir.tmpdir)
				@@process.start 

				@@running = true
			end 

			def self.pid
				return @@process.pid unless @@running == false
			end 

			def self.stop
				if @@process 
					begin 
					  @@process.poll_for_exit(0.3)
					rescue ChildProcess::TimeoutError
					  @@process.stop # tries increasingly harsher methods to kill the process.
					end
				end 
				@@running = false
			end 

		end
	end
end