# frozen_string_literal: true

require 'simplecov'

SimpleCov.start do
  add_filter "/spec/"

  add_group "lib", "lib"
end
puts "SimpleCov started successfully! Root: #{SimpleCov.root}"
