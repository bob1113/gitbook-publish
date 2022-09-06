# Container image that runs your code
FROM ubuntu:20.04

# Install git
RUN apt-get update
RUN apt-get install -y git

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Make your entrypoint.sh file executable
RUN chmod +x /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]