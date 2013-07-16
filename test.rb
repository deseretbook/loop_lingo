#!/usr/bin/env ruby
require 'loop_lingo'

LoopLingo.config do |l|
  l.login "deseret"
  l.pwd   "book book 123"
end

# loops = LoopLingo.loops
# puts "Loops: #{loops.size}"
# puts loops.to_s

# resp = LoopLingo.cancel_loop("L23528")
# puts resp.to_s

resp = LoopLingo.complete_loop("L23539")
puts resp.to_s


# Loop (id): L23528
# created: 2013-07-15T21:26:54+00:00
# fb_posted: false
# generation: 0
# image_url:
# message: Thanks Deseret Book for the Test
# parent:
# points: 0
# posted:
# price: 0.00
# product:
# product_id:
# promotion: 206
# revenue: 0.00
# total: 0.00
# url: http://localhost:3000/Book-Mormon-Heirloom-Edition-Deseret-Company/i/4236873
# user: 22082
