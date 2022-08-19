FROM ruby:3.1.2 AS base

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -yqq \
      netcat

WORKDIR /app

COPY Gemfile* ./

RUN bundle install

# API

FROM base AS api

COPY entrypoint.sh /usr/bin

RUN chmod +x /usr/bin/entrypoint.sh

# Daemons

FROM base AS daemons

COPY daemons_entrypoint.sh /usr/bin

RUN chmod +x /usr/bin/daemons_entrypoint.sh
