DOCKER_TARGET='justonecommand/s3-sync:0.7'

all: build-docker push-docker

build-docker:
	@docker build -t ${DOCKER_TARGET} .

push-docker:
	@docker push ${DOCKER_TARGET}
