FROM alpine:latest

RUN apk update && apk upgrade
# sqlite is not used, and has vulns
RUN apk del sqlite 
RUN apk add python3

# get the latest straight from the source - upstream version has known vulns
RUN wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 \
	&& mv jq-linux64 /usr/local/bin/jq \
	&& chmod +x /usr/local/bin/jq
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade awscli

ADD assets/ /opt/resource/
