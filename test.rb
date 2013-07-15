#!/usr/bin/env ruby
require 'loop_lingo'

LoopLingo.config do |l|
  l.login "deseret"
  l.pwd   "book book 123"
end

loops = LoopLingo.loops
puts loops.to_s
