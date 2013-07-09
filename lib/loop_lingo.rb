require 'rubygems'
require 'httparty'
require 'uri'
require 'multi_json'

require "loop_lingo/version"
require "loop_lingo/uris"
require "loop_lingo/request"
require "loop_lingo/request/post"
require "loop_lingo/request/get"
require "loop_lingo/request/loops"
require "loop_lingo/response"
require "loop_lingo/response/loops"

class LoopLingo
  def self.config(options = {})
    if block_given?
      yield self
    else
      login options[:login]
      pwd options[:pwd]
    end
  end

  # set the login id
  def self.login(login=nil)
    login ? @@login = login : @@login
  end

  # set the password
  def self.pwd(pwd=nil)
    pwd ? @@pwd = pwd : @@pwd
  end

  # get the loops for this account.
  def self.loops
    LoopLingo::Request::Loops.get(
  end
end
