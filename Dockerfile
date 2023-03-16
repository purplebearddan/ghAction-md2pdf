FROM alpine/node:latest
ENV PYTHONUNBUFFERED=1
RUN apk add --update nodejs npm
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
COPY ./* /app/
RUN mkdir -p /app/input /app/output
RUN cd /app
RUN npm install -g md-to-pdf
ENTRYPOINT ["/app/entrypoint.sh"]