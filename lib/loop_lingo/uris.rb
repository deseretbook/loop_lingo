class LoopLingo
  class Uris
    METHOD = "https"
    HOST = "merchant"
    DOMAIN = "looplingo.com"
    BASE_PATH = "api"

    def self.get_loops_uri
      "#{base_uri}/loops/?#{LoopLingo.url_credentials}"
    end

    def self.get_complete_loop_uri(loop_id)
      "#{base_uri}/loop/complete/#{loop_id}/"
    end

    def self.get_cancel_loop_uri(loop_id)
      "#{base_uri}/loop/cancel/#{loop_id}/"
    end

    def self.get_user_uri(user_id)
      "#{base_uri}/user/#{user_id}/?#{LoopLingo.url_credentials}"
    end

    def self.redeem_user_points_uri(user_id)
      "#{base_uri}/user/redeem/#{user_id}/"
    end

  private

    def self.base_uri
      "#{METHOD}://#{HOST}.#{DOMAIN}/#{BASE_PATH}"
    end
  end
end