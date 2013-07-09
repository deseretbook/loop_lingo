class LoopLingo
  class Request

  protected

    def self.error_response?(response)
      if !is_success?(response)
      elsif !is_json_error?(response)
      else
        false
      end
    end

  private

    def is_success?(response)
      response.kind_of? Net::HTTPSuccess
    end
  end
end