#!/usr/bin/env ruby
require 'awesome_print'
require 'byebug'
require 'benchmark'

test_data = []
0.upto(1000) do |i|
  test_data << [i, rand(11.0..12.0).round(2)]
end

def reduce_readings( data, number_values )
  window_size = data.count / number_values
  average_readings = data.each_slice(window_size).to_a.map.with_index do |a, i|
    total_sum = a.inject(0.0) { |sum, j| sum += j[1] }
    [i, (total_sum / a.size).round(2)]
  end
  average_readings
end

puts test_data.inspect
ap reduce_readings(test_data,100)
