require 'cucumber/instruments/version'
require 'cucumber/instruments/server'

module Cucumber
  module Instruments
    class << self
      attr_accessor :app_bundle_path, :inherit_io

      def configure 
        yield self 
      end 
    end
  end
end