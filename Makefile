# Makefile for creating container file
# Override these with environmental variables
VERSION?=20170417

### Do not override below

user=legalio
app=pubsub-emulator
version=$(VERSION)
registry=docker.io
image=$(registry)/$(user)/$(app)

all: container

container:
	docker build --tag=$(image):$(version) --tag=$(image):latest .

push:
	docker push $(image):$(version)

push-latest:
	docker push -- $(image):latest

push-all: push push-latest

.PHONY: all container push push-latest push-all
