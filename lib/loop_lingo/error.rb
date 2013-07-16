class LoopLingo::Error < LoopLingo::Response
  def initialize(response_body)
    begin
      r = MultiJson.load(response_body)
      errors << r["error"]
    rescue Exception => e
      puts e.message
      return false
    end
  end

  def to_s
    "Error: #{errors.join(", ")}"
  end
end