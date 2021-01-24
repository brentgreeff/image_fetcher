#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "image"

def banner
  <<~HEREDOC
    Usage: ./download -f example_files/urls.txt

    If you want to load a file that is outside of the image_fetcher app directory, you will need to mount that volume into the container.

    - Copy the source file into the project first.
  HEREDOC
end

require 'optparse'

input_file = nil

OptionParser.new do |opts|
  opts.banner = banner

  opts.on(
    '-f',
    '--file PATH'
  ) { |f| input_file = f }

end.parse!

raise OptionParser::MissingArgument, 'file -f (file)' if input_file.nil?

def download_files(input_file)
  file = File.read(input_file)

  if file.empty?
    warn "Input file is empty"
    exit(false)
  end
  count = Image.download(file, destination: ENV.fetch('DOWNLOAD_DIR'))
  puts "#{count} File(s) downloaded!"
end

download_files(input_file)
