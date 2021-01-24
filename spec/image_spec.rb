# frozen_string_literal: true

require 'timecop'

require_relative '../lib/image'

RSpec.describe "Image" do
  before { Timecop.freeze(Time.local(2021, 1, 2, 10, 20, 30)) }
  after { Timecop.return }

  context '#download' do

    context 'one image' do
      let(:file) { File.read 'example_files/one_url.txt' }
      before { Image.download(file, destination: 'downloads/tmp/') }

      it 'downloads the file' do
        expect(
          File.exist? "downloads/tmp/02-01-2021_10.20.30_UTC/webp"
        ).to be
      end
    end

    context 'first too large' do
      let(:file) { File.read 'example_files/first_too_large.txt' }

      it 'skips the first & downloads the second file' do
        with_modified_env MAX_SIZE: '5' do
          Image.download(file, destination: 'downloads/tmp/')
        end
        expect(
          File.exist? "downloads/tmp/02-01-2021_10.20.30_UTC/2"
        ).to be
      end
    end
  end

  after { `rm -fr downloads/tmp/*` }
end
