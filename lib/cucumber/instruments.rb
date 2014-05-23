require 'cucumber/instruments/version'
require 'cucumber/instruments/server'
require 'cucumber/instruments/client'

module Cucumber
  module Instruments
    class << self
      def configure 
        yield self 
      end 

      def inherit_io= should_inherit
        @inherit_io = should_inherit
      end 

      def inherit_io
        @inherit_io ||= false 
      end 

      def xcodebuild
        @xcodebuild ||= XCodebuildConfig.new 
      end

      def start
        Cucumber::Instruments::Server.start 
      end 

      def running?
        Cucumber::Instruments::Server.running?
      end 

      def stop
        Cucumber::Instruments::Server.stop 
      end 

      def app_bundle_path 
        if @app_bundle_path then 
          return @app_bundle_path
        else 
          build_settings = Cucumber::Instruments.xcodebuild.settings 
          return "#{build_settings["CONFIGURATION_BUILD_DIR"]}/#{build_settings["EXECUTABLE_FOLDER_PATH"]}"
        end 
      end 

      def app_bundle_path= path 
         @app_bundle_path = path 
      end  
    end

    class XCodebuildConfig
      attr_accessor :xcodeproj, :xcworkspace, :scheme, :sdk, :configuration, :env

      def settings
        output = `xcodebuild -project #{Cucumber::Instruments.xcodebuild.xcodeproj} \
                              -configuration #{Cucumber::Instruments.xcodebuild.configuration} \
                              -scheme #{Cucumber::Instruments.xcodebuild.scheme} \
                              -sdk #{Cucumber::Instruments.xcodebuild.sdk} \
                              -showBuildSettings`
        settings = {}
        output.scan(/^\s{4}(\w+)\ =\ ?(.+$)?/) { |m| settings[m[0]]=m[1] } 
        return settings 
      end 
    end 
  end
end