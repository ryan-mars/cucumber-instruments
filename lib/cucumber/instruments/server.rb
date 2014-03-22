require 'childprocess'

module Cucumber
	module Instruments
		class Server 
			@@pid = nil 
			@@process = nil

			def self.running?
				return @@running 
			end 			

			def self.start
				#@@process = ChildProcess.build(%Q|#{File.expand_path('../../../../bin/unix_instruments.sh', __FILE__)}|,
				@@process = ChildProcess.build("/Applications/Xcode.app/Contents/Developer/usr/bin/instruments",
										"-t",
										"/Applications/Xcode.app/Contents/Developer/../Applications/Instruments.app/Contents/PlugIns/AutomationInstrument.bundle/Contents/Resources/Automation.tracetemplate",
										"-w", "iPhone Retina (4-inch) - Simulator - iOS 7.1",
				 						"/Users/ryan/code/cucumber-instruments/instruments-server/build/TestApp.app",
				 						"-e", "UIASCRIPT", 
				 						"/Users/ryan/code/cucumber-instruments/instruments-server/test.js" )
				
				lib_path = "/Users/ryan/Dropbox/Code/cucumber-instruments/cucumber-instruments/bin"
				@@process.environment["DYLD_INSERT_LIBRARIES"] = "#{lib_path}/InstrumentsShim.dylib"
				@@process.environment["LIB_PATH"] = "#{lib_path}"
				#@@process.io.inherit!
				@@process.cwd = '/tmp'
				@@process.start 

				@@running = true
			end 

			def self.cmd 
				device_flag = '-w iPhone Retina (4-inch) - Simulator - iOS 7.1'
				path_to_automation_template = '/Applications/Xcode.app/Contents/Developer/../Applications/Instruments.app/Contents/PlugIns/AutomationInstrument.bundle/Contents/Resources/Automation.tracetemplate'
				app_dir = '/Users/ryan/code/cucumber-instruments/instruments-server/build/TestApp.app'
				env_variables_for_cli = '-e UIASCRIPT /Users/ryan/code/cucumber-instruments/instruments-server/test.js' 
				cmd = %Q|"#{File.expand_path('../../../bin', __FILE__)}/unix_instruments.sh" \
        #{device_flag} \
        -t "#{path_to_automation_template}" \
        "#{app_dir}" \
        #{env_variables_for_cli}|

        #-D "#{trace_file_path}" \
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