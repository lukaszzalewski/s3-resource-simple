FROM python:3.7-alpine3.10

RUN apk update && apk upgrade
# sqlite is not used, and has vulns
RUN apk del sqlite 

# get the latest straight from the source - upstream version has known vulns
RUN wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 \
	&& mv jq-linux64 /usr/local/bin/jq \
	&& chmod +x /usr/local/bin/jq
RUN pip install --upgrade pip
RUN pip install --upgrade awscli

ADD assets/ /opt/resource/
