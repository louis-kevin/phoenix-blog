FROM elixir:1.12

RUN apt-get update && \
    apt-get install -y postgresql-client && \
    apt-get install -y inotify-tools && \
    apt-get install -y nodejs && \
    curl -L https://npmjs.org/install.sh | sh && \
    mix local.hex --force && \
    mix archive.install hex phx_new 1.5.9 --force && \
    mix local.rebar --force

ENV APP_HOME /app
RUN mkdir /app
COPY . /app
WORKDIR /app

# Compile the project
RUN mix do compile
