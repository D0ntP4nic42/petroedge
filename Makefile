.PHONY: db-up db-down db-reset

COMPOSE ?= docker compose

db-up:
	$(COMPOSE) up -d postgres

db-down:
	$(COMPOSE) down

db-reset:
	$(COMPOSE) down --volumes
