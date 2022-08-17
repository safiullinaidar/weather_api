FROM ruby:3.1.2

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -yqq \
      netcat

WORKDIR /app

COPY Gemfile* ./

RUN bundle install

COPY entrypoint.sh /usr/bin

RUN chmod +x /usr/bin/entrypoint.sh

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
