require 'cucumber/instruments/version'

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
      end 

      def running?
      end 
    end

    class XCodebuildConfig
      attr_accessor :xcodeproj, :xcworkspace, :scheme, :sdk, :configuration
    end 
  end
end