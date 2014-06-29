require 'cucumber/instruments/version'
require 'cucumber/instruments/server'
require 'cucumber/instruments/client'
require 'cucumber/instruments/xcodebuild'
require 'cucumber/instruments/xcodebuild_config'

module Cucumber
  module Instruments
    class << self
      attr_accessor :app_bundle_path

      def xcodebuild
        @xcodebuild ||= XcodebuildConfig.new
      end

      def configure
        yield self
      end

      def inherit_io= should_inherit
        @inherit_io = should_inherit
      end

      def inherit_io
        @inherit_io ||= false
      end

      def launch
        Cucumber::Instruments::Server.start(app_bundle_path)
      end
    end
  end
end