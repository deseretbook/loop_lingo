require 'spec_helper'
require 'loop_lingo'

describe LoopLingo::Loop do
  let(:klass) { LoopLingo::Loop }

  let(:valid_attributes) do
    {
      "product"     => "",
      "product_id"  => "",
      "parent"      => nil,
      "created"     => "2013-07-15T21:26:54+00:00",
      "generation"  => 0,
      "price"       => "0.00",
      "revenue"     => "0.00",
      "id"          => "L23528",
      "url"         => "http://localhost:3000/Book-Mormon-Heirloom-Edition-Deseret-Company/i/4236873",
      "points"      => 0,
      "image_url"   => "",
      "user"        => 22082,
      "fb_posted"   => false,
      "promotion"   => 206,
      "total"       => "0.00",
      "message"     => "Thanks Deseret Book for the Test",
      "posted"       => nil
    }
  end

  let(:valid_loop) { klass.new(valid_attributes) }

  let(:mock_boolean_response) do
    double(:boolean_response)
  end

  describe "#initialize" do
    it "must populate @attributes with the passed data" do
      h = { "a" => :b }
      k = klass.new(h)
      k.attributes.must == h
    end
  end

  describe "#method_missing" do
    it "must return the matching attributes value if there is one" do
      valid_loop.promotion.must == valid_attributes['promotion']
    end

    it "must call super if there no matching attributes value" do
      lambda { valid_loop.invalid }.must raise_exception
    end
  end

  describe "complete!" do
    it "must call LoopLingo.complete() with the appropriate arguments" do
      LoopLingo.should_receive(:complete_loop).with(
        valid_attributes['id'], {
          :price => valid_attributes['price'],
          :total => valid_attributes['total'],
        }
      ).and_return(mock_boolean_response)

      valid_loop.complete!.must == mock_boolean_response
    end

    it "must allow arguments to be specified" do
      LoopLingo.should_receive(:complete_loop).with(
        valid_attributes['id'], {
          :price => 99.0,
          :total => 101.0,
          :foo => 'bar'
        }
      ).and_return(mock_boolean_response)

      valid_loop.complete!(
        {:price => 99.0, :total => 101.0, :foo => 'bar'}
      ).must == mock_boolean_response
    end
  end

  describe "cancel!" do
    it "must call LoopLingo.cancel() with the appropriate arguments" do
      LoopLingo.should_receive(:cancel_loop).with(
        valid_attributes['id']
      ).and_return(mock_boolean_response)

      valid_loop.cancel!.must == mock_boolean_response
    end
  end
end