#!/usr/bin/env ruby
require 'active_support/all'
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

big_test_data = []
end_time = Time.now
start_time = end_time - 1.week
curr_time = start_time
while(curr_time < end_time)
  big_test_data << {
    timestamp: curr_time,
    moisture: rand(11.0..12.0)
  }
  curr_time += 10.minutes + rand(1..360).seconds
end

Time.zone = 'Eastern Time (US & Canada)'

def time_windows(data, window_size)
  end_time = Time.zone.now
  start_time = end_time - 1.week
  windowed_data = []
  curr_time = start_time
  while( curr_time < end_time ) do
    window_end = curr_time + window_size.minutes
    rows_in_range = data.select{ |r| r[:timestamp] > curr_time && r[:timestamp] <= window_end }
    rows_in_range_total = rows_in_range.inject(0.0){ |sum, j| sum += j[:moisture] }
    windowed_data << {
      timestamp: curr_time,
      average: ( rows_in_range_total / rows_in_range.size )
    }
    curr_time = curr_time + window_size.minutes
  end
  windowed_data
end

windowme = time_windows(big_test_data, 60)
ap big_test_data.count
ap windowme.count
