# frozen_string_literal: true

# https://github.com/simplecov-ruby/simplecov/issues/346
# system calls are not included in coverage reports - only ruby that is required will be measured.

RSpec.describe "running the script" do
  let(:download) { './lib/download.rb' }

  it 'displays an error for missing arguments' do
    expect { system %(#{download}) }
      .to output(a_string_including("missing argument:"))
      .to_stderr_from_any_process
  end

  it 'displays a success message when passed a file' do
    expect { system %(#{download} -f example_files/urls.txt) }
      .to output(a_string_including(success))
      .to_stdout_from_any_process
  end

  def success
    <<~HEREDOC
      Files downloaded!
    HEREDOC
  end

  context 'with invalid input' do

    it 'displays an error for missing file' do
      expect { system %(#{download} -f does-not-exist) }
        .to output(a_string_including("No such file or directory"))
        .to_stderr_from_any_process
    end

    it 'displays an error for blank file' do
      expect { system %(#{download} -f example_files/blank.txt) }
        .to output(a_string_including("Input file is empty"))
        .to_stderr_from_any_process
    end
  end
end
