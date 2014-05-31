require 'cucumber/instruments/version'
require 'cucumber/instruments/server'
require 'cucumber/instruments/client'
require 'cucumber/instruments/xcodebuild_config'
require 'cucumber/instruments/xcodebuild'

module Cucumber
  module Instruments
    class << self
      attr_accessor :app_bundle_path

      def configure 
        yield self 
      end 

      def inherit_io= should_inherit
        @inherit_io = should_inherit
      end 

      def inherit_io
        @inherit_io ||= false 
      end

      def start
        Cucumber::Instruments::Server.start(app_bundle_path)
      end 

      def running?
        Cucumber::Instruments::Server.running?
      end 

      def stop
        Cucumber::Instruments::Server.stop 
      end 
    end
  end
end