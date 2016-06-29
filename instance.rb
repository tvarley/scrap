#!/usr/bin/env ruby
require 'benchmark'

# Benchmark class
class Metric
  attr_accessor :var

  def initialize(n)
    @n   = n
    @var = 22
  end

  def run
    bar = 0
    Benchmark.bm(10) do |x|
      x.report('@var =') { @n.times { |i| @var = i } }
      x.report('var =') { @n.times { |i| self.var = i } }
      x.report('bar') { @n.times { |i| bar = i } }
    end
    puts "#{@var},#{var},#{bar}"
  end
end

metric = Metric.new(100_000_000)
metric.run
