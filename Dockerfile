FROM node:8.11.3

LABEL maintainer "Coders.Tokyo Community"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && apt-get install -y \
  vim \
  --fix-missing --no-install-recommends \
  # Keep image size down
  && rm -rf /var/lib/apt/lists/*

WORKDIR /home/root

RUN npm install -g hexo-cli
EXPOSE 4000
