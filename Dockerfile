FROM ubuntu:22.04
LABEL maintainer="Britton Mathews <britton.mathews@backit.com>"

ENV DEBIAN_FRONTEND=noninteractive

# Install Ruby and dependencies
RUN apt-get update && \
    apt-get install -y ruby rubygems && \
    rm -rf /var/lib/apt/lists/*

# Install fake-s3
RUN gem install fakes3 -v 0.2.5

# Set up fake-s3 directory and default command
RUN mkdir -p /fakes3_root
ENTRYPOINT ["/usr/local/bin/fakes3"]
CMD ["-r", "/fakes3_root", "-p", "4569"]
EXPOSE 4569
