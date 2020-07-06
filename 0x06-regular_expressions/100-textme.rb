#!/usr/bin/env ruby
sender = ARGV[0].scan(/from:(\+?\w*)/).join
receiver = ARGV[0].scan(/to:(\+?\w*)/).join
flags = ARGV[0].scan(/flags:(\D*\d*\D*\d*\D*\d*\D*\d*\D*\d*)/).join
output = sender + "," + receiver + "," + flags
puts output
