class LoopLingo
  class Request

  protected

    def http_error?(response)
      !response.kind_of? Net::HTTPSuccess
    end

    def json_error?(response_body)
      false
    end

  end
end