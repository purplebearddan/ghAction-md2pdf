FROM alpine/node:latest

# add curl
RUN apk add --update curl bash

# install nvm and use nvm to install node and npm (better consistancy in install method)
# also installs md-to-pdf for actual conversion
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | sh
RUN export NVM_DIR="$HOME/.nvm"
RUN nvm install node
RUN nvm install-latest-npm
RUN npm install -g md-to-pdf

# install python3 for file processing and cat-ing
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python

# copy the action repo to /app
COPY ./* /app/

# make the output folder and cd into app
RUN mkdir -p /app/output && cd /app

# start the container
ENTRYPOINT ["/app/entrypoint.sh"]