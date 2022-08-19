#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Waiting for weather_api${NC}"
while ! nc -z weather_api 3000; do sleep 1 ; done

echo -e "${GREEN}Installing gems${NC}"
bundle install

$@
