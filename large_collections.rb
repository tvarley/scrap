#!/usr/bin/env ruby

require 'byebug'

def rand_range(ranger)
  rand * (ranger.end - ranger.begin) + ranger.begin
end

# Setup
one_year = []
365.times do |d|
  420.times do |c|
    one_year << {
      a: rand_range((10..100)).round(2),
      b: rand_range((10..100)).round(2),
      c: c,
      d: d
    }
  end
end

total = 0
one_year.each do |p|
  total += p[:a]
end

puts total
