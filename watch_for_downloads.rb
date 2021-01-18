#!/usr/bin/env ruby

$stdout.sync = true
require 'listen'

listener = Listen.to('/usr/src/app/downloads') do |modified, added, removed|
  puts "Modified: #{modified}" if modified.any?
  puts "Added: #{added}" if added.any?
  puts "Removed: #{removed}" if removed.any?
end
listener.start

sleep
