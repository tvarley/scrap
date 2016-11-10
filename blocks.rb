#!/usr/bin/env ruby

def test1
  a = 11
  test2 if a == 10
  
end

def test2
  20
end

puts "#{test1}"
