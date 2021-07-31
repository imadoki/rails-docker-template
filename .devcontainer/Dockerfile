FROM ruby:3

# add node
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get update -qq && \
  apt-get install -y --no-install-recommends git tig nodejs vim redis-tools && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
RUN npm install -g yarn

ARG GID="1000"
ARG UID="1000"
RUN groupadd --gid ${GID} dev \
  && useradd --uid ${UID} --gid dev --shell /bin/bash --create-home dev
USER dev
ENV APP_ROOT /home/dev/rails-docker-template
RUN mkdir -p ${APP_ROOT}
WORKDIR ${APP_ROOT}
RUN bundle config set path 'vendor/bundle'
