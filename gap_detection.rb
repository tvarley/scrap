#!/usr/bin/env ruby

require 'awesome_print'
require 'active_support/all'

def detect_breaks( source, break_gap )
  return nil if (source.nil? || break_gap.nil?)
  result = [source.first]

  last = result[0]
  source.each do |curr|
    gap = (curr - last)
    last = curr
    next if gap < break_gap
    result << last
    result << curr
  end
  result << source.last
  result
end

#test1 = [1,2,3,10,11,12,14,100,101]
test2 = []

d2 = Time.now
end_dt = nil
loop do
  d1 = ( end_dt && ( end_dt + (rand(7200).minutes ))) || 2.years.ago
  start_dt = d1 + ( d2 - d1 ) * rand
  end_dt = [ start_dt + (rand(240.0) + 30).minutes, d2 - 1.minute ].min

  next if rand(10) > 8

  observation_time = start_dt
  while( observation_time < end_dt )
    observation_time = observation_time + 5.minutes
    test2 << observation_time
  end

  break if end_dt > ( d2 - 5.minutes )
end

test2.each { |d| ap d }
brks = detect_breaks(test2,15.minutes)
puts '-----------------'
brks.each { |d| ap d }

brk2 = []
brks.in_groups_of(2).each do |d|
  brk2 << {
    start_dt: d[0],
    end_dt: d[1],
    length: (d[1] - d[0]) / 60
  }
end
ap brk2


