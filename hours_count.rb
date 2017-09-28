#!/usr/bin/env ruby

require 'awesome_print'
require 'byebug'
require 'active_support/all'

# DateTime extensions
class Time
  def to_whour
    (wday * 24) + hour
  end
end

def hours_count(dates)
  hour_accum = Array.new((24 * 7)) { 0 }
  byebug
  dates.each{ |date| (date[0].to_whour..date[1].to_whour).each { |h| hour_accum[h] += 1 } }
  result = {}
  %i(sun mon tue wed thu fri sat).each_with_index do |day, i|
    result[day] = hour_accum[(i * 24)..((i * 24) + 23)]
  end
  result
end

# ap hours_count([[5.hours.ago.to_datetime, 4.hours.ago.to_datetime]])

dates = [
  [23.hours.ago, 21.hours.ago],
  [5.hours.ago, 2.hours.ago],
  [1.week.ago - 5.hours, 1.week.ago - 2.hours]
]

ap hours_count(dates)
