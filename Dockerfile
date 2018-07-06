# Use an official Ubuntu as a parent image
FROM ubuntu:18.04

LABEL maintainer="lzutao https://github.com/lzutao/docker-texlive"

# Set the working directory to /root
WORKDIR /tmp/workdir

ENV LANG="C.UTF-8"

COPY ./boostrap.sh ./

# Install texlive packages
RUN bash ./boostrap.sh

# Run command when the container launches
#CMD ["echo", "hello world!"]
