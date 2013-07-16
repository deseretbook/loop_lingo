class LoopLingo
  class Request

  protected

    def http_error?(response)
      !response.kind_of? Net::HTTPSuccess
    end

    def json_error?(response_body)
      begin
        res = MultiJson.load(response_body)
      rescue Exception => e
        puts e.message
        return false
      end

      res.class == Hash && res["error"].to_s.size > 0
    end

  end
end