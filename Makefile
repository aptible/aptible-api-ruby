## Build and pull docker compose images
build:
	touch docker/Gemfile.lock
	docker compose build --pull

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
clean:
	truncate -s 0 docker/Gemfile.lock && \
	docker compose down --remove-orphans --volumes

.PHONY: build bash test
