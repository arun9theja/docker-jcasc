#Authored by Phillip Bailey
.PHONY: all 
.SILENT:
SHELL := '/bin/bash'

USERNAME=p0bailey

IMAGE=docker-jcasc

all:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build:  ## Build docker image!
	docker-compose up --build --no-start

up: ## Run
	docker-compose up -d

stop: ## Stop services
	docker-compose down

logs: ## Show container logs
	docker-compose logs

restart: ## Restart services.
	docker-compose restart

rebuild: ## Rebuild a clean environment.
	 make clean && make build && make up

clean: ## Delete everything.
	docker-compose down -v  && rm -rf jenkins_home || true

shell: ## Get a shell into the container.
	 docker run -it p0bailey/jenkins:alpine /bin/bash
