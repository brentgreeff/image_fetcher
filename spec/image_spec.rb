# frozen_string_literal: true

require 'timecop'

require_relative '../lib/image'

RSpec.describe "Image" do
  before { Timecop.freeze(Time.local(2021, 1, 2, 10, 20, 30)) }
  after { Timecop.return }

  let(:file) { File.read 'example_files/one_url.txt' }

  context '#download' do
    before { Image.download(file, destination: 'downloads/tmp/') }

    it 'downloads the file' do
      expect(
        File.exist? "downloads/tmp/02-01-2021_10.20.30_UTC/webp"
      ).to be
    end
  end

  after { `rm -fr downloads/tmp/*` }
end
