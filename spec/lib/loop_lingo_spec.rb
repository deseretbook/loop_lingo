require 'spec_helper'
require 'loop_lingo'

describe LoopLingo do
  let(:klass) { LoopLingo }

  describe ".login" do
    it "must accept a value and return the current value" do
      klass.login('xxx')
      klass.login.must == 'xxx'
    end
  end

  describe ".pwd" do
    it "must accept a value and return the current value" do
      klass.pwd('yyy')
      klass.pwd.must == 'yyy'
    end
  end

  describe ".config" do
    it "must allow login and pwd to be set using a hash" do
      klass.config({
        :login => 'abc',
        :pwd   => 'xyz'
      })

      klass.login.must == 'abc'
      klass.pwd.must == 'xyz'
    end

    it "must allow login and pwd to be set using a block" do
      klass.config do |k|
        k.login 'aaa'
        k.pwd   'bbb'
      end

      klass.login.must == 'aaa'
      klass.pwd.must == 'bbb'
    end
  end

  describe ".loops" do
    before(:each) do
      LoopLingo.stub(:login).and_return('LOGIN')
      LoopLingo.stub(:pwd).and_return('PWD')
    end

    it "must issue a get request to the loops url and query the response" do
      mock_get_response = double(:get_response)
      LoopLingo::Request::Get.stub(:new).with(
        LoopLingo::Uris.get_loops_uri,
        LoopLingo::Loops
      ).and_return(double(:get_request, :response => mock_get_response))

      LoopLingo.loops.must == mock_get_response
    end
  end

  describe ".loops" do
    before(:each) do
      LoopLingo.stub(:login).and_return('LOGIN')
      LoopLingo.stub(:pwd).and_return('PWD')
    end

    it "must issue a get request to the loops url and query the response" do
      mock_get_response = double(:get_response)
      LoopLingo::Request::Get.stub(:new).with(
        LoopLingo::Uris.get_loops_uri,
        LoopLingo::Loops
      ).and_return(double(:get_request, :response => mock_get_response))

      LoopLingo.loops.must == mock_get_response
    end
  end

  describe ".complete_loop" do
    before(:each) do
      LoopLingo.stub(:login).and_return('LOGIN')
      LoopLingo.stub(:pwd).and_return('PWD')
    end

    it "must issue a post to complete a loop" do
      mock_get_response = double(:get_response)
      LoopLingo::Request::Post.stub(:new).with(
        LoopLingo::Uris.get_complete_loop_uri("L123"),
        LoopLingo::Boolean,
        { :total => 0.0, :price => 0.0, :login => 'LOGIN', :pwd => 'PWD' }
      ).and_return(double(:get_request, :response => mock_get_response))

      LoopLingo.complete_loop("L123").must == mock_get_response
    end
  end

  describe ".cancel_loop" do
    before(:each) do
      LoopLingo.stub(:login).and_return('LOGIN')
      LoopLingo.stub(:pwd).and_return('PWD')
    end

    it "must issue a post to cancel a loop" do
      mock_get_response = double(:get_response)
      LoopLingo::Request::Post.stub(:new).with(
        LoopLingo::Uris.get_cancel_loop_uri("L123"),
        LoopLingo::Boolean,
        { :login => 'LOGIN', :pwd => 'PWD' }
      ).and_return(double(:get_request, :response => mock_get_response))

      LoopLingo.cancel_loop("L123").must == mock_get_response
    end
  end
end