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
end