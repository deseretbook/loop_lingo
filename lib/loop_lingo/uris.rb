class LoopLingo
  class Uris
    METHOD = "https"
    HOST = "merchant"
    DOMAIN = "looplingo.com"
    BASE_PATH = "api"

    def self.get_loops_uri
      "#{base_uri}/loops/?#{url_credentials}"
    end

    def self.get_complete_loop_uri(loop_id, options = {})
      options_str = options.map{|k,v| "#{k}=#{v}" }.join("&")
      options_str = "&#{options_str}" if options_str.size > 0
      uri = "#{base_uri}/loop/complete/#{loop_id}/?#{url_credentials}#{options_str}"
      puts uri
      uri
    end

    # returns: "{\"status\": \"ok\"}"
    def self.get_cancel_loop_uri(loop_id)
      "#{base_uri}/loop/cancel/#{loop_id}/?#{url_credentials}".tap do |s|
        puts s
      end
    end

  private

    def self.url_credentials
      "login=#{LoopLingo.login}&pwd=#{URI.encode(LoopLingo.pwd)}"
    end

    def self.base_uri
      "#{METHOD}://#{HOST}.#{DOMAIN}/#{BASE_PATH}"
    end
  end
end