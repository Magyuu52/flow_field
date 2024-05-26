FROM ruby:3.0.4
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /flow_spot
WORKDIR /flow_spot
ADD Gemfile /flow_spot/Gemfile
ADD Gemfile.lock /flow_spot/Gemfile.lock
RUN bundle install
ADD . /flow_spot