class LoopLingo::Loop
  attr_reader :attributes
  def initialize(loop_attributes)
    @attributes = loop_attributes
  end

  def to_s
    str = "Loop (id): #{@attributes['id']}\n"
    @attributes.keys.reject{|a| a== 'id'}.sort.each do |aa|
      str << "\t#{aa}: #{@attributes[aa]}\n"
    end
    str
  end

  def method_missing(meth, *args, &block)
    if @attributes.keys.include?(meth.to_s)
      @attributes[meth.to_s]
    else
      super
    end
  end

  def complete!(options = {})
    LoopLingo.complete_loop(
      @attributes['id'], {
        :price => @attributes['price'],
        :total => @attributes['total'],
      }.merge(options)
    )
  end

  def cancel!
    LoopLingo.cancel_loop(@attributes['id'])
  end
end