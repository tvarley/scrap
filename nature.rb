#!/usr/bin/env ruby
# Simple class taken from SE
# @see http://programmers.stackexchange.com/questions/321428/name-of-a-symbol-in-ruby
class Port
  attr_accessor :nature, :name

  def initialize(name)
    @name = name
  end
end

x_port = Port.new('x')
x_port.nature = :sampling
# x_port.wont_be_nil
x_port.nature.name.must_equal :sampling
