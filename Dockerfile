FROM ruby:2.6.3-alpine
LABEL maintainer="Patricio Tapia <ptapiaugalde@gmail.cl>"
RUN apk update && \
    apk add postgresql-dev build-base tzdata && \
    rm -rf /var/cache/apk*

RUN mkdir /app
WORKDIR /app

# Environment variables


COPY Gemfile Gemfile.lock ./
RUN bundle config --global frozen 1
RUN bundle install --without development test

COPY . .

EXPOSE 3000
CMD rails server
