FROM ruby:2.6.3
LABEL maintainer="Patricio Tapia <ptapiaugalde@gmail.cl>"
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs cron && \
      rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

RUN touch /var/log/cron.log
RUN bundle exec whenever --write-crontab --set environment=development

EXPOSE 3000
