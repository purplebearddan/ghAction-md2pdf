FROM ubuntu:latest

RUN dpkg --add-architecture i386
RUN apt-get update
# chrome deps
# RUN apt-get install -y libnss3-dev ca-certificates fonts-liberation libasound2 libatk-bridge2.0-0 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgbm1 libgcc1 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 lsb-release wget xdg-utils
# install chrome as per https://pptr.dev/troubleshooting#running-puppeteer-in-docker
RUN apt-get update \
    && apt-get install -y wget gnupg \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-freefont-ttf libxss1 --no-install-recommends
    # && rm -rf /var/lib/apt/lists/*

RUN apt-get install -y bash build-essential curl gcc make
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN curl -fsSL https://deb.nodesource.com/setup_19.x | bash - && apt-get install -y nodejs
RUN apt-get install -y python3

# copy the action repo to /app/
COPY "./*" "/app/"

# make the output folder and cd into app
RUN mkdir -p "/app/output"

RUN cd "/app"

# start the container
ENTRYPOINT ["/app/entrypoint.sh"]