class LoopLingo::Loop < LoopLingo::Response
  def initialize(attributes)
    attributes.each do |k,v|
      self.instance_variable_set("@#{k}".to_sym, v)
      self.class.class_eval{attr_reader k.to_sym}
    end
  end
end