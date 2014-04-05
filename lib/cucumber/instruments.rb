require 'cucumber/instruments/version'
require 'cucumber/instruments/server'

module Cucumber
  module Instruments
    class << self
      attr_accessor :app_bundle_path, :inherit_io

      def configure 
        yield self 
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
    end

    class XCodebuildConfig
      attr_accessor :xcodeproj, :xcworkspace, :scheme, :sdk, :configuration
    end 
  end
end