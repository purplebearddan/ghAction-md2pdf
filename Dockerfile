FROM ubuntu:latest

RUN apt update
RUN apt install -y bash build-essential curl gcc make 
RUN apt install libgobject
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN curl -fsSL https://deb.nodesource.com/setup_19.x | bash - && apt install -y nodejs
RUN apt install python3

# copy the action repo to /app/
COPY "./*" "/app/"

# make the output folder and cd into app
RUN mkdir -p "/app/output" && cd "/app"

# start the container
ENTRYPOINT ["/app/entrypoint.sh"]