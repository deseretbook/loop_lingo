class LoopLingo::Request::Post < LoopLingo::Request
  attr_reader :response

  def initialize(uri, response_klass, options = {})

    r = HTTParty.post(
      uri,
      {
        :headers => { 'Content-Type' => 'application/json' },
        :body => options
      }
    ).response

    @response = if http_error?(r)
      LoopLingo::HttpError.new(r)
    elsif json_error?(r.body)
      LoopLingo::Error.new(r.body)
    else
      response_klass.new(r.body)
    end

  end
end
