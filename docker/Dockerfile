FROM ruby:3

# add node
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
# add chrome
# RUN curl --sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add -
# RUN echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
# RUN apt-get install -y --no-install-recommends google-chrome-stable
RUN apt-get update -qq && \
  apt-get install -y --no-install-recommends git nodejs && \
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
# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.187.0/containers/ruby/.devcontainer/base.Dockerfile

# [Choice] Ruby version: 3, 3.0, 2, 2.7, 2.6
## ARG VARIANT="3.0"
## FROM mcr.microsoft.com/vscode/devcontainers/ruby:0-${VARIANT}

# [Option] Install Node.js
## ARG INSTALL_NODE="true"
## ARG NODE_VERSION="lts/*"
## RUN if [ "${INSTALL_NODE}" = "true" ]; then su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# [Optional] Uncomment this line to install additional gems.
# RUN gem install <your-gem-names-here>

# [Optional] Uncomment this line to install global node packages.
# RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g <your-package-here>" 2>&1
