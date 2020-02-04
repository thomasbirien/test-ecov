FROM ruby:2.4.1
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /test-ecov
WORKDIR /test-ecov
COPY Gemfile /test-ecov/Gemfile
COPY Gemfile.lock /test-ecov/Gemfile.lock
RUN gem install bundler -v 2.0.1
RUN bundle install
COPY . /test-ecov


# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
