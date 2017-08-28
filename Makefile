# if using docker PROJECT should be your username
PROJECT=`whoami`
NAME=$${PWD\#\#*/}
VERSION=0.1
REGISTRY=`minishift openshift registry`

.PHONY: all build tag_latest release

all: build

build:
	docker build -t $(PROJECT)/$(NAME):$(VERSION) --rm .
#	docker build -t $(NAME):$(VERSION) --rm .

tag_latest:
	docker tag $(PROJECT)/$(NAME):$(VERSION) $(REGISTRY)/$(PROJECT)/$(NAME):latest
#	docker tag $(NAME):$(VERSION) $(REGISTRY)/$(PROJECT)/$(NAME):latest

release: tag_latest
	@if ! docker images $(PROJECT)/$(NAME) | awk '{ print $$2 }' | grep -q -F $(VERSION); then echo "$(NAME) version $(VERSION) is not yet built. Please run 'make build'"; false; fi
	@echo ">>> pushing $(REGISTRY)/$(PROJECT)/$(NAME)"
	docker push $(REGISTRY)/$(PROJECT)/$(NAME)
	@echo ">>> released"

deploy:
    docker run -d -p 61616:61616 $(PROJECT)/$(NAME)

# --name simple -e ARTEMIS_USERNAME=admin -e ARTEMIS_PASSWORD=smartvm 

# https://github.com/durandom/manageiq-kafka-client/blob/master/collector/Makefile (this file)
# https://github.com/marcelocaj/artemis-hawtio-docker (ui too)
# https://github.com/vromero/activemq-artemis-docker (base image)
