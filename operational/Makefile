.PHONY: build deps proto.generate fmt lint test run up down reset db-up db-down db-reset

COMPOSE ?= docker compose

build:
	mix compile

deps:
	mix deps.get

proto.generate:
	mix proto.generate

fmt:
	mix format --check-formatted

lint:
	mix format --check-formatted

test:
	mix test

run:
	mix run --no-halt

up: db-up

down: db-down

reset: db-reset

db-up:
	$(COMPOSE) up -d operational-postgres

db-down:
	$(COMPOSE) down

db-reset:
	$(COMPOSE) down --volumes
