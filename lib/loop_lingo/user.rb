class LoopLingo::User
  attr_reader :attributes
  def initialize(response_body)
    @attributes = MultiJson.load(response_body)
  end

  def to_s
    str = "User (id): #{@attributes['id']}\n"
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

  def redeem!(points)
    LoopLingo.redeem_user_points(@attributes['id'], points.to_i)
  end
end

# User (id): 22082
#   birthdate:
#   gender: u
#   generic_points: 0
#   name:
#   points: 75