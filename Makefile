.PHONY: check-dependencies help start stop restart logs

.DEFAULT_GOAL := help


check-dependencies: 
	@docker --version

help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?# "}; {printf "\033[36m%-40s\033[0m %s\n", $$1, $$2}'

start: ## Start all the services
	@docker compose up -d

stop: ## Shutdown all the services
	@docker compose down

restart: ## Restart all the services
	@docker compose down && docker compose up -d

logs: ## Show the logs of all servers
	@docker compose logs