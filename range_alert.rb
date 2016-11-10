#!/usr/bin/env ruby
require 'bigdecimal'

def above_range?(value, target, threshold)
  return nil unless value && target && threshold
  range = (target - threshold .. target + threshold)
  puts "Range: #{range.to_s}"
  value > range.last
end

def below_range?(value, target, threshold)
  return nil unless value && target && threshold
  range = (target-threshold .. target+threshold)
  puts "Range: #{range.to_s}"
  value < range.first
end

def outside(value, target, threshold)
  return nil unless value && target && threshold
  if above_range?(value, target, threshold)
    value - (target + threshold)
  elsif below_range?(value, target, threshold)
    (target - threshold) - value
  else
    0
  end
end


value = BigDecimal.new("44.3")
target = BigDecimal.new("19.5")
threshold = BigDecimal.new("2.5")

puts "AB: #{above_range?(value, target,threshold)}"
puts "BE: #{below_range?(value, target,threshold)}"
puts "OUT: #{outside(value, target, threshold)}"
