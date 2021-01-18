FROM ruby:2.7.2

RUN apt-get update -yqq && apt-get install -yqq \
  vim

COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app

ENV BUNDLE_PATH /usr/src/gems
ENV GEM_HOME /usr/src/gems/ruby/2.7.0
RUN bundle install

COPY . /usr/src/app/

CMD [ "./watch_for_downloads.rb" ]
