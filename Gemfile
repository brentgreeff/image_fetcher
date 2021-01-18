# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'listen'

group :development, :test do
  gem 'rspec'
  gem 'guard-rspec', require: false
  gem 'pry'
  gem 'pry-doc'
  gem 'awesome_print'
end

group :development do
  gem 'rubocop', require: false
  gem 'flog', require: false
end

group :test do
  gem 'simplecov', require: false
end
