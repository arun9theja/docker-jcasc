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
	docker-compose up -d && open http://127.0.0.1:8080

down: ## Down
	docker-compose down

logs: ## Show container logs
	docker-compose logs

restart: ## reload
	docker-compose restart

rebuild: ## rebuild
	 make clean && make build && make up

clean: ## Down
	docker-compose down -v  && rm -rf jenkins_home || true

shell: ## SHELL
	 docker run -it p0bailey/jenkins:alpine /bin/bash
