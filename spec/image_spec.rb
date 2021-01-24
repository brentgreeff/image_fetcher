# frozen_string_literal: true

require 'timecop'

require_relative '../lib/image'

RSpec.describe "Image" do
  before { Timecop.freeze(Time.local(2021, 1, 2, 10, 20, 30)) }
  after { Timecop.return }
  let(:dest) { 'downloads/tmp/' }

  context '#download' do

    context 'one image' do
      let(:file) { File.read 'example_files/one_url.txt' }
      before { Image.download(file, destination: dest) }

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
          expect {
            Image.download(file, destination: dest)
          }.to output(
            a_string_including(
              'http://httpbin/bytes/100001 -- file is too large (max is 0MB)'
            )
          ).to_stderr
        end
        expect(
          File.exist? "downloads/tmp/02-01-2021_10.20.30_UTC/2"
        ).to be
      end
    end

    context 'too many redirects' do
      let(:file) { File.read 'example_files/too_many_redirects.txt' }

      it 'prints an error' do
        expect {
          Image.download(file, destination: dest)
        }.to output(
          a_string_including(
            "http://httpbin/redirect/3 -- 2 redirections exceeded"
          )
        ).to_stderr
      end
    end

    context 'timeout' do
      let(:file) { File.read 'example_files/timeout.txt' }

      it 'prints an error' do
        expect {
          with_modified_env TIMEOUT: '0.0001' do
            Image.download(file, destination: dest)
          end
        }.to output(
          a_string_including(
            "http://httpbin/delay/10 -- #{"Read error (Connection timed out) in headers.\n" * 3}"
          )
        ).to_stderr
      end
    end
  end

  after { `rm -fr downloads/tmp/*` }
end
