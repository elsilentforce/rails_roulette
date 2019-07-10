FROM ruby:2.6.3-alpine
LABEL maintainer="Patricio Tapia <ptapiaugalde@gmail.cl>"
RUN apk update && \
    apk add postgresql-dev build-base tzdata nodejs curl && \
    rm -rf /var/cache/apk*

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3000
