#!/usr/bin/env ruby

email='tim.varley@gmail.com'

# unless email.present? && (email =~ /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ )
#   puts "No"
# else
#   puts "Yes"
# end

if email.nil? || !(email =~ /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ )
  puts "No"
else
  puts "Yes"
end
