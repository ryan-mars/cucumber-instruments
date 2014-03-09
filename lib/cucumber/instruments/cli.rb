require 'thor'

module Cucumber
  module Instruments
		class CLI < Thor
      desc "automate", "Run an app on the device or in the simulator using Instruments"
      method_option :app,
                    :banner => "/path/to/your.app",
                    :desc => "Specify the path to your app bundle",
                    :required => true,
                    :type => :string
      def automate
        command = %{/Users/ryan/code/cucumber-instruments/instruments-server/build/instruments \
          -t "/Applications/Xcode.app/Contents/Developer"/../Applications/Instruments.app/Contents/PlugIns/AutomationInstrument.bundle/Contents/Resources/Automation.tracetemplate \
          "#{options[:app]}" \
          -e UIASCRIPT /Users/ryan/code/cucumber-instruments/instruments-server/test.js}
        system command 
      end

      default_task :automate
		end
  end
end

