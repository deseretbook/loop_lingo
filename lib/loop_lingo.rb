require 'rubygems'
require 'httparty'
require 'uri'
require 'multi_json'

require "loop_lingo/version"
require "loop_lingo/uris"
require "loop_lingo/request"
require "loop_lingo/request/post"
require "loop_lingo/request/get"

require "loop_lingo/response"
require "loop_lingo/error"
require "loop_lingo/http_error"

require "loop_lingo/loop"
require "loop_lingo/loops"
require "loop_lingo/user"
require "loop_lingo/boolean"

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
    LoopLingo::Request::Get.new(
      LoopLingo::Uris.get_loops_uri,
      LoopLingo::Loops
    ).response
  end

  def self.complete_loop(loop_id, options = {})
    options[:total] = 0.0 unless options[:total]
    options[:price] = 0.0 unless options[:price]

    LoopLingo::Request::Post.new(
      LoopLingo::Uris.get_complete_loop_uri(loop_id),
      LoopLingo::Boolean,
      options.merge(LoopLingo.form_post_credentials)
    ).response
  end

  def self.cancel_loop(loop_id)
    LoopLingo::Request::Post.new(
      LoopLingo::Uris.get_cancel_loop_uri(loop_id),
      LoopLingo::Boolean,
      LoopLingo.form_post_credentials
    ).response
  end

  def self.get_user(user_id)
    LoopLingo::Request::Get.new(
      LoopLingo::Uris.get_user_uri(user_id),
      LoopLingo::User
    ).response
  end

  def self.redeem_user_points(user_id, points)
    LoopLingo::Request::Post.new(
      LoopLingo::Uris.redeem_user_points_uri(user_id),
      LoopLingo::Boolean,
      { :points => points }.merge(LoopLingo.form_post_credentials)
    ).response
  end


private

  def self.form_post_credentials
    {
      :login => LoopLingo.login,
      :pwd   => LoopLingo.pwd
    }
  end

  def self.url_credentials
    "login=#{URI.encode(LoopLingo.login)}&pwd=#{URI.encode(LoopLingo.pwd)}"
  end

end
