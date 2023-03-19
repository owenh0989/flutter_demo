# define standard colors
ifneq (,$(findstring xterm,${TERM}))
	BLACK        := $(shell tput -Txterm setaf 0)
	RED          := $(shell tput -Txterm setaf 1)
	GREEN        := $(shell tput -Txterm setaf 2)
	YELLOW       := $(shell tput -Txterm setaf 3)
	LIGHTPURPLE  := $(shell tput -Txterm setaf 4)
	PURPLE       := $(shell tput -Txterm setaf 5)
	BLUE         := $(shell tput -Txterm setaf 6)
	WHITE        := $(shell tput -Txterm setaf 7)
	RESET := $(shell tput -Txterm sgr0)
else
	BLACK        := ""
	RED          := ""
	GREEN        := ""
	YELLOW       := ""
	LIGHTPURPLE  := ""
	PURPLE       := ""
	BLUE         := ""
	WHITE        := ""
	RESET        := ""
endif

# set target color
TARGET_COLOR := $(BLUE)

POUND = \#

.PHONY: no_targets__ info help build deploy doc
	no_targets__:

.DEFAULT_GOAL := help

colors: 
	@echo "${BLACK}BLACK${RESET}"
	@echo "${RED}RED${RESET}"
	@echo "${GREEN}GREEN${RESET}"
	@echo "${YELLOW}YELLOW${RESET}"
	@echo "${LIGHTPURPLE}LIGHTPURPLE${RESET}"
	@echo "${PURPLE}PURPLE${RESET}"
	@echo "${BLUE}BLUE${RESET}"
	@echo "${WHITE}WHITE${RESET}"

.PHONY: all
all: clean setup run_dev_mock

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: setup
setup: 
	@echo "${GREEN}╠ Project setup${RESET}"
	@fvm flutter pub get
	@fvm flutter pub run easy_localization:generate --source-dir assets/translations -f keys -o locale_keys.g.dart
	@fvm flutter packages pub run build_runner build --delete-conflicting-outputs

.PHONY: gen
gen: 
	@echo "${BLUE}Generate code. . . ${RESET}"
	@fvm flutter pub run easy_localization:generate --source-dir assets/translations -f keys -o locale_keys.g.dart
	@fvm flutter pub run build_runner build --delete-conflicting-outputs

.PHONY: analyze
analyze:
	@echo "${BLUE}Analyze code. . . ${RESET}"
	@fvm flutter analyze
	@fvm flutter pub run dart_code_metrics:metrics analyze lib

.PHONY: format
format:
	@echo "${YELLOW}╠ Format code. . . ${RESET}"
	@dart format .

.PHONY: upgrade
upgrade: clean ## 依存関係をアップグレードする
	@echo "${LIGHTPURPLE}╠ Upgrade dependencies. . . ${RESET}"
	@fvm flutter pub upgrade

.PHONY: clean
clean: ## 環境をきれいにします。
	@echo "${YELLOW}╠ Clean build code${RESET}"
	@rm -rf pubspec.lock
	@fvm flutter clean

.PHONY: run
run:
	@fvm flutter run --flavor dev --target lib/main_dev.dart

.PHONY: flavor
flavor: ## lefthookインストール
	@echo "${GREEN}╠ flavorを更新する${RESET}"
	@fvm flutter pub run flutter_flavorizr -p android:buildGradle,android:androidManifest,ios:xcconfig,ios:buildTargets,ios:schema,ios:plist

.PHONY: delete generated file
delete-generate-file: ## コード生成を削除
	@echo "コード生成を削除"
	@find . -maxdepth 20 -type f \( -name "*.freezed.dart" -o  -name "*.g.dart" \) -delete