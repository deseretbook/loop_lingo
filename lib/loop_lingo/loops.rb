class LoopLingo::Loops < LoopLingo::Response
  include Enumerable
  attr_reader :loops
  def initialize(response_body)
    response = MultiJson.load(response_body)

    @loops = []
    response.each do |loop_data|
      @loops << LoopLingo::Loop.new(loop_data)
    end
  end

  def each(&block)
    @loops.each do |lloop|
      yield lloop
    end
  end

  def last
    @loops.last
  end

  def to_s
    @loops.map(&:to_s).join("\n")
  end
end