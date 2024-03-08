# Erlkaf Example

This is an application to demonstrate Erlkaf failing to start up when running with Elixir 1.15.7-otp-26 and Erlang 26.2.2.

## Steps to reproduce

I've tested this on an m1 Macbook Pro as well as an Ubuntu 22.04 Docker image. For simplicity, I'm writing instructions on how to reproduce on my workstation (m1 Macbook Pro).

- Install erlkaf dependencies 
        
        brew install openssl@1.1 lz4 zstd curl

- I'm using asdf to manage Erlang/Elixir versions 
  
        asdf install

- Start up Kafka and Zookeeper 
        
        docker compose up

- Build the project
 
        export MIX_ENV=prod
        mix deps.get
        mix deps.compile --force
        mix compile --force
        mix release

- Run the application

        KAFKA_BROKERS=localhost:9092 _build/prod/rel/erlkaf_example/bin/erlkaf_example start

At this point the application will be stuck starting up. If you run this with release 24 of Erlang with a clean build this application will start up fine.