require 'childprocess'
require 'tmpdir'

module Cucumber
	module Instruments
		class Server 
			class << self 
				@process = nil

				def running?
					return @process.alive?
				end 			

				def start
					@process = ChildProcess.build("/Applications/Xcode.app/Contents/Developer/usr/bin/instruments",
											"-t",
											"/Applications/Xcode.app/Contents/Developer/../Applications/Instruments.app/Contents/PlugIns/AutomationInstrument.bundle/Contents/Resources/Automation.tracetemplate",
											"-w", "iPhone Retina (4-inch) - Simulator - iOS 7.1",
					 						Cucumber::Instruments.app_bundle_path,
					 						"-e", "UIASCRIPT", 
					 						"/Users/ryan/Code/cucumber-instruments/instruments-server/test.js" )
					
					lib_path = "/Users/ryan/Code/cucumber-instruments/cucumber-instruments/bin"
					@process.environment["DYLD_INSERT_LIBRARIES"] = "#{lib_path}/InstrumentsShim.dylib"
					@process.environment["LIB_PATH"] = "#{lib_path}"
					@process.io.inherit!
					@process.cwd = Dir.mktmpdir("cucumber-instruments",Dir.tmpdir)
					@process.start 
				end 

				def pid
					return @process.pid unless @process.exited?
				end 

				def stop
					if @process 
						begin 
						  @process.poll_for_exit(0.3)
						rescue ChildProcess::TimeoutError
						  @process.stop # tries increasingly harsher methods to kill the process.
						end
					end 
				end 
			end
		end
	end
end