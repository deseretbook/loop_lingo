require "loop_lingo/version"
require "loop_lingo/request"
require "loop_lingo/request/post"
require "loop_lingo/request/get"
require "loop_lingo/response"

class LoopLingo
  VERSION = "0.1.0"

  def self.config(options = {})
    if block_given?
      yield self
    else
      login options[:login]
      pwd options[:pwd]
    end
  end

  def self.login(login=nil)
    login ? @@login = login : @@login
  end

  def self.pwd(pwd=nil)
    pwd ? @@pwd = pwd : @@pwd
  end
end
