#!/usr/bin/env ruby

def test_one
  raise Exception.new("Why then")
  # fail "Why now?"
rescue => e
  puts "e[#{e}]"
end

test_one
