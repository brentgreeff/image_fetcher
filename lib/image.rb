# frozen_string_literal: true

require "down"
Down.backend :wget

class Image

  class << self
    def download(file, destination:)
      time = Time.now.strftime("%d-%m-%Y_%H.%M.%S_UTC")
      @path = "#{destination}/#{time}"
      `mkdir -p #{@path}`

      file.each_line( &method(:process) )
      count_files
    end

    private

    def process(url)
      url.chomp!
      filename = url.split('/').last

      Down.download(
        url,
        destination: "#{@path}/#{filename}",
        max_size: ENV.fetch('MAX_SIZE').to_i,
        read_timeout: ENV.fetch('TIMEOUT').to_f,
        tries: 3
      )
    rescue Down::Error => e
      warn "#{url} -- #{e} (#{e.class.name})"
    end

    def count_files
      `ls #{@path} | wc -l`.chomp.to_i
    end
  end
end
