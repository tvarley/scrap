#!/usr/bin/env ruby

require 'awesome_print'
require 'active_support/all'

# DateTime extensions
class DateTime
  def to_whour
    ((wday - 1) * 24 + hour)
  end
end

def hours_count(*dates)
  hour_accum = Array.new((24 * 7)) { 0 }
  dates.each { |date| (date[0].to_whour..date[1].to_whour).each { |h| hour_accum[h] += 1 } }
  ap hour_accum
  result = {}
  %i(mon tue wed thu fri sat sun).each_with_index do |day, i|
    ap day
    ap i
    ap ((i * 24)..((i * 24) + 23))
    result[day] = hour_accum[(i * 24)..((i * 24) + 23)]
  end
end

ap hours_count([5.hours.ago.to_datetime, 4.hours.ago.to_datetime])
