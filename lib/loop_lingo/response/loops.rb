class LoopLingo::Response::Loops < LoopLingo::Response
  attr_reader :loops
  def initialize(response_body)
    response = MultiJson.load(response_body)

    loops = []
    response.each do |loop_data|
      loops << LoopLingo::Loop.new(loop_data)
    end

  end
end