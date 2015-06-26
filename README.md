Erlang+Nginx Base for Docker
============================

This is a Dockerfile and other files required for building docker containers
which will run Erlang services published through nginx.

Build instructions:

docker build -t jjamor/erlang-nginx-base .

Usage example:

docker run --privileged="true" --name="coretest" -h coretest.yourdomain.com -t -i jjamor/erlang-nginx-base /usr/bin/erl

