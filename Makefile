# linux #
INSTALL_GO = wget https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz
TAR_GO = tar -C /usr/local -xzf ~/AWS_tutorial/go1.8.3.linux-amd64.tar.gz
SET_MODULE_ON = export GO111MODULE=on
SET_GO_PATH = export PATH=$$PATH:/usr/local/go/bin

# yarn #
YARN = yarn

YARN_DEV = $(YARN) dev
YARN_BUILD = $(YARN) build
YARN_START = $(YARN) start

# go #
GO = go
MAIN_GO = ./server/main.go
BINARY_DEV = ./server/binary/api_dev
BINARY_DEPLOY = ./server/binary/api
LINUX_ENV = GOOS=linux GOARCH=amd64

GO_BUILD = $(GO) build
GO_BUILD_DEV = $(GO_BUILD) -o $(BINARY_DEV) $(MAIN_GO)
GO_BUILD_DEPLOY = $(LINUX_ENV) $(GO_BUILD) -o $(BINARY_DEPLOY) $(MAIN_GO)

GO_RUN = $(GO) run $(MAIN_GO)

help: ## makeコマンド一覧
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

client_dev: ## nuxt.jsを開発モードで立ち上げる
	$(YARN)
	$(YARN_DEV)

client_deploy: ## nuxt.jsをビルドして本番用に立ち上げる
	$(YARN)
	$(YARN_BUILD)
	$(YARN_START)

api_dev: ## apiサーバをローカル環境で動かす
	$(SET_MODULE_ON)
	$(GO_BUILD_DEV)
	$(BINARY_DEV)

api_deploy: ## apiサーバを本番環境（Linux）で動かす
	$(INSTALL_GO)
	$(TAR_GO)
	$(SET_GO_PATH)
	$(SET_MODULE_ON)
	$(GO_BUILD_DEPLOY)
	$(BINARY_DEPLOY)