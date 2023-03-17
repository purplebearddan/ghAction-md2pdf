FROM alpine/node:latest

ENV PYTHONUNBUFFERED=1
ENV NODE_VERSION 18
ENV NVM_DIR "$HOME/.nvm"

# add curl and bash
RUN apk add --update curl bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# install python3 for file processing and cat-ing
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python

# install nvm and use nvm to install node and npm (better consistancy in install method)
# also installs md-to-pdf for actual conversion
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash; \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default \
    && nvm install-latest-npm \
    && npm install -g md-to-pdf


# copy the action repo to /app/
COPY "./*" "/app/"

# make the output folder and cd into app
RUN mkdir -p "/app/output" && cd "/app"

# start the container
ENTRYPOINT ["/app/entrypoint.sh"]