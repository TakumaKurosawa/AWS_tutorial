# docker-compose #
COMPOSE = docker-compose

COMPOSE_UP = $(COMPOSE) up -d
COMPOSE_DOWN = $(COMPOSE) down --rmi all
COMPOSE_LOGS = $(COMPOSE) logs

help: ## makeコマンド一覧
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

start: ## APIサーバとWebアプリを立ち上げるコマンド
	$(COMPOSE_UP)

stop: ## APIサーバとWebアプリをクローズするコマンド
	$(COMPOSE_DOWN)

log: ## 立ち上げているコンテナのログを表示するコマンド
	$(COMPOSE_LOGS)
