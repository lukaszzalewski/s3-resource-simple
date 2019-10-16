all: login-ecr build-docker push-docker
	
login-ecr:
	@`aws ecr get-login --no-include-email --region us-east-1`

build-docker:
	@docker build -t ${DOCKER_TARGET} .

push-docker:
	@docker push ${DOCKER_TARGET}
