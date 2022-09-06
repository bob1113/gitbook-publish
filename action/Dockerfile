# Container image that runs your code
FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y git

# Setup environment (nvm, nodejs, gitbook-cli)
# RUN apt-get update
# RUN echo 'y' | apt install curl 
# RUN apt install -y curl 

# RUN curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
# RUN . ~/.nvm/nvm.sh
# RUN nvm install 10.22.0
# RUN apt-get install nodejs
# RUN npm install gitbook-cli -g
# RUN apt-get install git

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Make your entrypoint.sh file executable
RUN chmod +x /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]