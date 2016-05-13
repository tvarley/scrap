#!/usr/bin/env ruby

require 'byebug'
require 'awesome_print'
require 'benchmark'

CHECK_SYM = {
  check_sym_01: 1,
  check_sym_02: 2,
  check_sym_03: 3,
  check_sym_04: 4,
  check_sym_05: 5
}.freeze

check_strings = [
  ['Sym01', 10.0],
  ['Sym02', 20.0],
  ['Sym03', 30.0],
  ['Sym04', 40.0],
  ['Sym05', 50.0]
].freeze

find_me = :check_sym_01
got_data = false
got_data2 = false
my_value = 0.0

sym_map = {
  'Sym01' => :check_sym_01,
  'Sym02' => :check_sym_02,
  'Sym03' => :check_sym_03,
  'Sym04' => :check_sym_04,
  'Sym05' => :check_sym_05
}.freeze

Benchmark.bmbm do |x|
  x.report('map') do
    1_000_000.times do
      check_strings.each do |e|
        next if sym_map[e[0]] != find_me
        my_value = e[1]
        break
      end
    end
  end

  x.report('switch') do
    1_000_000.times do
      check_strings.each do |e|
        my_value = e[1]
        case e[0]
        when 'Sym01'
          if find_me == :check_sym_01
            got_data = true
            break
          end
        when 'Sym02'
          if find_me == :check_sym_02
            got_data = true
            break
          end
        when 'Sym03'
          if find_me == :check_sym_03
            got_data = true
            break
          end
        when 'Sym04'
          if find_me == :check_sym_04
            got_data = true
            break
          end
        when 'Sym05'
          if find_me == :check_sym_05
            got_data = true
            break
          end
        end
      end
    end
  end
end
