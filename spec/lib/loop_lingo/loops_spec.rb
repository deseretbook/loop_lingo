require 'spec_helper'
require 'loop_lingo'

describe LoopLingo::Loops do
  let(:klass) { LoopLingo::Loops }

  let(:valid_json) do
    '[{"product": "", "product_id": "", "parent": null, "created": "2013-07-15T21:26:54+00:00", "generation": 0, "price": "0.00", "revenue": "0.00", "id": "L23528", "url": "http://localhost:3000/Book-Mormon-Heirloom-Edition-Deseret-Company/i/4236873", "points": 0, "image_url": "", "user": 22082, "fb_posted": false, "promotion": 206, "total": "0.00", "message": "Thanks Deseret Book for the Test", "posted": null}]'
  end

  let(:valid_loop) { klass.new(valid_json) }

  describe "#initialize" do
    it "must populate @loops with the passed json" do
      k = klass.new(valid_json)
      k.loops.size.must == 1
    end

    it "must populate @loops with Loop classes" do
      k = klass.new(valid_json)
      k.loops.first.class.must == LoopLingo::Loop
    end
  end
end