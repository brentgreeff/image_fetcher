# frozen_string_literal: true

require "down"

class Image

  class << self
    def download(file, destination:)
      time = Time.now.strftime("%d-%m-%Y_%H.%M.%S_UTC")
      path = "#{destination}/#{time}"
      `mkdir -p #{path}`

      file.each_line do |url|
        url.chomp!
        filename = url.split('/').last
        Down.download(url, destination: "#{path}/#{filename}")
      end
      count_files(path)
    end

    private

    def count_files(path)
      `ls #{path} | wc -l`.chomp.to_i
    end
  end
end
