class LoopLingo::Request::Loops < LoopLingo::Request
  def self.get
    response = HTTParty.get(
      LoopLingo::Uris.loops_uri,
      :headers => { 'Content-Type' => 'application/json' }
      ).response


    if error_response?(response)
      return LoopLingo::Response.new(response.body)
    else
      return LoopLingo::Response::Loops.new(response.body)
    end

  end
end
