class LoopLingo
  class Uris
    METHOD = "https"
    HOST = "merchant"
    DOMAIN = "looplingo.com"
    BASE_PATH = "api"

    def self.loops_uri
      "#{base_uri}/loops/?#{credentials_for_get}"
    end

  private

    def self.credentials_for_get
      "login=#{LoopLingo.login}&pwd=#{URI.encode(LoopLingo.pwd)}"
    end

    def self.base_uri
      "#{METHOD}://#{HOST}.#{DOMAIN}/#{BASE_PATH}"
    end
  end
end