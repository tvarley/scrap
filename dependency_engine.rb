#!/usr/bin/env ruby

# Monkey patch <tt>String</tt> to include underscore
class String
  def underscore
    word = dup
    word.gsub!(/::/, '/')
    word.gsub!(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
    word.gsub!(/([a-z\d])([A-Z])/, '\1_\2')
    word.tr!('-', '_')
    word.downcase!
    word
  end
end

class Association
  ASSOC_TYPE = [
    :belongs_to,
    :has_one,
    :has_many,
    :has_and_belongs_to_many
  ]

  attr_accessor :through

  def through
    @through || false
  end
end

class FileDepends
  attr_accessor :name
  attr_accessor :associations
  attr_reader :base

  def initialize(name)
    @name = name
  end

  def base # This is a comment
    Pathname.new(@name).basename
  end

  def associations
    if @associations.nil?
      File.open(@name, 'r') do |f|
        f.each_line do |line|
          # Strip out all commented code
          line.tr
          /#.*\n/
        end
      end
    end
  end
end

require 'pathname'
# 1. Scan all models
scan_dir = '/Users/tvarley/project/ugmo/ugmoknows-2.0/app/models'

dependable_files = []

Dir.glob(Pathname.new(scan_dir).join('**').join('*.rb')).each do |filename|
  dependable_files << FileDepends.new(filename)


end

dependable_files.each { |dp| puts dp.base }
