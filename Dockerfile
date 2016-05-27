FROM alpine:latest
MAINTAINER Payment 21 Dev <devteam@payment21.com>

RUN apk add --update --no-progress alpine-sdk nodejs unrar bash git

RUN apk add --update python python-dev py-pip 
	
RUN export PYTHONPATH=/usr/bin && \
	export PYTHON=/usr/bin/python && \
	export PATH=$PATH:/usr/bin/python && \
	export USER=root && \
	export HOME=/tmp && \
    npm config set python $(which python) && \
    npm install -g aglio
    
RUN mkdir -p /opt/apidocs/
ADD p21RestApi /opt/apidocs/

VOLUME /opt/apidocs/
WORKDIR /opt/apidocs/

CMD tail -f /dev/null
