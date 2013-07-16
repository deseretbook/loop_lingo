class LoopLingo::Boolean < LoopLingo::Response
  attr_reader :response_body

  def success?
    !!@success
  end

  # assumes body will be: "{\"status\": \"ok\"}"
  def initialize(response_body)
    @response_body = response_body
    response = MultiJson.load(response_body)
    begin
      @success = (response["status"] == "ok")
    rescue Exceptiuon => e
      errors << e.message
      @success = false
    end
  end

  def to_s
    "Success: #{@success}"
  end
end