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

    # [{"product": "", "product_id": "", "parent": null, "created": "2013-07-15T21:26:54+00:00", "generation": 0, "price": "0.00", "revenue": "0.00", "id": "L23528", "url": "http://localhost:3000/Book-Mormon-Heirloom-Edition-Deseret-Company/i/4236873", "points": 0, "image_url": "", "user": 22082, "fb_posted": false, "promotion": 206, "total": "0.00", "message": "Thanks Deseret Book for the Test", "posted": null}]
  end

  def method_missing(meth, *args, &block)
    if @attributes.keys.include?(meth.to_s)
      @attributes[meth.to_s]
    else
      super
    end
  end
end