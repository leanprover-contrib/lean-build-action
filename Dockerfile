# Container image that runs your code
FROM python:3.8-buster

# Copies your code file from your action repository to the filesystem path `/` of the container

COPY . /lean-build-action/

RUN python -m pip install --upgrade pip mathlibtools
RUN curl https://raw.githubusercontent.com/Kha/elan/master/elan-init.sh -sSf | sh -s -- -y

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/lean-build-action/entrypoint.sh"]