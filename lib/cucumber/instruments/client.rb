require 'faraday'

module Cucumber
module Instruments
  class Client 
    def self.uia_execute(javascript)
      puts "SENDING: #{javascript}"
      conn = Faraday.new(:url => 'http://localhost:8000') do |faraday|
        faraday.response  :logger  
        faraday.adapter   Faraday.default_adapter
        faraday.request   :retry, max: 3, interval: 0.5,
                          exceptions: ['Faraday::ConnectionFailed']
      end

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
          puts "RETRYING...."
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