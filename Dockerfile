FROM ruby:3.2.2
RUN apt-get update -qq && apt-get install -y postgresql-client
WORKDIR /labs
COPY Gemfile /labs/Gemfile
COPY Gemfile.lock /labs/Gemfile.lock
RUN bundle install
COPY . /labs
