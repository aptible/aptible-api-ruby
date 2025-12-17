
export COMPOSE_IGNORE_ORPHANS ?= true
export RUBY_VERSION ?= 2.3.1
RUBY_VERSION_MAJOR = $(word 1,$(subst ., ,$(RUBY_VERSION)))
export BUNDLER_VERSION ?=
ifeq ($(BUNDLER_VERSION),)
ifeq ($(RUBY_VERSION_MAJOR),2)
export BUNDLER_VERSION = 1.17.3
endif
endif
PROJECT_NAME = $(shell ls *.gemspec | sed 's/\.gemspec//')
export COMPOSE_PROJECT_NAME ?= $(PROJECT_NAME)-$(subst .,_,$(RUBY_VERSION))

default: help

## Show this help message
help:
	@echo "\n\033[1;34mAvailable targets:\033[0m\n"
	@awk 'BEGIN {FS = ":"; prev = ""} \
					/^## / {prev = substr($$0, 4); next} \
					/^[a-zA-Z_-]+:/ {if (prev != "") printf "  \033[1;36m%-20s\033[0m %s\n", $$1, prev; prev = ""} \
					{prev = ""}' $(MAKEFILE_LIST) | sort
	@echo

BUILD_ARGS ?=
## Build and pull docker compose images
build: gemfile-lock
	docker compose build --pull $(BUILD_ARGS)

## Create a Gemfile.lock specific to the container (i.e., for the ruby version)
gemfile-lock:
	mkdir -pv ./docker/ruby-$(RUBY_VERSION)/ && \
	echo '' > ./docker/ruby-$(RUBY_VERSION)/Gemfile.lock

## Open shell in a docker container, supports CMD=
bash: build
	$(MAKE) run CMD=bash

CMD ?= bash
## Run command in a docker container, supports CMD=
run:
	docker compose run --rm runner $(CMD)

## Run tests in a docker container, supports ARGS=
test: build
	$(MAKE) test-direct ARGS="$(ARGS)"

## Run tests in a docker container without building, supports ARGS=
test-direct:
	$(MAKE) run CMD="bundle exec rspec $(ARGS)"

## Run rubocop in a docker container, supports ARGS=
lint: build
	$(MAKE) lint-direct ARGS="$(ARGS)"

## Run rubocop in a docker container without building, supports ARGS=
lint-direct:
	$(MAKE) run CMD="bundle exec rake rubocop $(ARGS)"

## Clean up docker compose resources
clean: clean-gemfile-lock
	docker compose down --remove-orphans --volumes

## Clean up the container specific Gemfile.lock
clean-gemfile-lock:
	rm -v ./docker/ruby-$(RUBY_VERSION)/Gemfile.lock ||:

.PHONY: build bash test
