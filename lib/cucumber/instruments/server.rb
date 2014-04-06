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
					dylib_path = File.expand_path("../../../instruments", __dir__) 
					xcode_path = `xcode-select -p`.chomp
					@process = ChildProcess.build("#{xcode_path}/usr/bin/instruments",
											"-t",
											"#{xcode_path}/../Applications/Instruments.app/Contents/PlugIns/AutomationInstrument.bundle/Contents/Resources/Automation.tracetemplate",
											"-w", "iPhone Retina (4-inch) - Simulator - iOS 7.1",
					 						Cucumber::Instruments.app_bundle_path,
					 						"-e", "UIASCRIPT", 
					 						"#{dylib_path}/cucumber-instruments.js" )
					
					@process.environment["DYLD_INSERT_LIBRARIES"] = "#{dylib_path}/InstrumentsShim.dylib"
					@process.environment["LIB_PATH"] = "#{dylib_path}"
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