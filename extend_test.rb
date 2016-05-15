#!/usr/bin/env ruby
module ModuleTest
  def hello_world
    puts 'Hello world'
  end
  def self.hello_world2
    puts 'Hello world2'
  end
end

class MyClass
  # include ModuleTest
  extend ModuleTest
end

c = MyClass.new
# c.hello_world
c.hello_world2
