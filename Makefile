all: build-loader build-verify-loader

Docker/loader: loader
	cp loader Docker/loader

build-loader: Docker/loader
	docker build -t logging-load-driver -f Docker/Dockerfile.loader Docker

Docker/verify-loader: verify-loader
	cp verify-loader Docker/verify-loader

build-verify-loader: Docker/verify-loader
	docker build -t logging-load-verifier -f Docker/Dockerfile.verify Docker 

push:
	push-image.sh logging-load-verifier:latest openshift/logging-load-verifier:latest
	push-image.sh logging-load-driver:latest openshift/logging-load-driver:latest
