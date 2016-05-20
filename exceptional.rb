#!/usr/bin/env ruby

def test_one
  # raise Exception.new("Why then")
  fail 'Why now?'
rescue => e
  puts "e[#{e}]"
end

def test_two
  return 1 if 1 == 1
  2
end

def test_three
  test_hash = nil
  puts 'Found' if test_hash.key?(:test)
end

def test_four
  # fail "One"
  begin
    fail "Two"
  rescue => e
    puts "e2[#{e}]"
  end
rescue => e
  puts "e[#{e}]"
end

def test_five
  fail "WTF"
  false
rescue
  nil
end

test_one
puts test_two
# test_three
test_four
test = test_five
if test
  puts 'trueish'
else
  puts 'unknownish'
end
