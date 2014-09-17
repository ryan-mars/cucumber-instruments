require 'faraday'

module Cucumber
module Instruments
  class Client
    def self.uia_execute(javascript)
      url = 'http://localhost:8000'
      conn = Faraday.new(:url => url)

      begin
        response = conn.post do |req|
          req.url '/command'
          req.headers['Content-Type'] = 'text/plain'
          req.body = javascript
        end
      rescue Faraday::ConnectionFailed => e
        retries ||= 0
        if retries < 30
          if retries < 1
            print "Waiting for #{url}"
          else
            print "."
          end
          sleep 0.5
          retries +=  1
          retry
        else
          puts "TIMED OUT!  "
          raise e
        end
      end

      response.body
    end
  end
end
end