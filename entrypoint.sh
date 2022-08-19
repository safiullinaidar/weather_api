#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Waiting for weather_api->db connection to be established...${NC}"
while ! nc -z db 5432; do sleep 1 ; done

echo -e "${GREEN}Installing gems${NC}"
bundle install

echo -e "${GREEN}Creating database${NC}"
bundle exec rails db:create db:migrate:with_data || exit $?
RAILS_ENV=test bundle exec rails db:create db:migrate || exit $?

$@
