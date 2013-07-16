class LoopLingo::HttpError < LoopLingo::Response
  def initialize(response)
    errors << response.body
  end
end