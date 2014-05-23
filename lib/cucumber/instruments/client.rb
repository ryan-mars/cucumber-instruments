require 'faraday'

module Cucumber
module Instruments
  class Client 
    def self.uia_execute(javascript)
      conn = Faraday.new(:url => 'http://localhost:8000')

      begin 
        response = conn.post do |req|
          req.url '/command'
          req.headers['Content-Type'] = 'text/plain'
          req.body = javascript
        end
      rescue Faraday::ConnectionFailed => e
        retries ||= 0
        retries +=  1
        if retries < 60
          sleep 0.5
          retry
        else 
          raise e
        end 
      end 

      response.body
    end 
  end 
end
end 