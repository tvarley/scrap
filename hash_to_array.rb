#!/usr/bin/env ruby

require 'awesome_print'

test_data = Array.new(100) { { m: rand(11.0..13.0),n: rand(11.0..13.0),o: rand(11.0..13.0) } }

ap test_data

ap test_data.map(&:values)

