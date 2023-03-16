FROM alpine/node:latest
ENV PYTHONUNBUFFERED=1
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
RUN nvm install node
RUN nvm install-latest-npm
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
COPY ./* /app/
RUN mkdir -p /app/input /app/output
RUN cd /app
RUN npm install -g md-to-pdf
ENTRYPOINT ["/app/entrypoint.sh"]