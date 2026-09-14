# Service directories to orchestrate. Override with: make SERVICES="operational other" up
SERVICES ?= operational

.PHONY: help up down reset build deps proto.generate fmt lint test

help:
	@printf '%s\n' \
		'up       Start every service stack' \
		'down     Stop every service stack' \
		'reset    Stop stacks and remove their volumes' \
		'build    Compile every service' \
		'deps     Fetch every service dependency' \
		'proto.generate  Generate every service protobuf module' \
		'fmt      Check formatting in every service' \
		'lint     Run every service linter' \
		'test     Run every service test suite'

up:
	@set -e; \
	for service in $(SERVICES); do \
		$(MAKE) --no-print-directory -C "$$service" up; \
	done

down:
	@set -e; \
	for service in $(SERVICES); do \
		$(MAKE) --no-print-directory -C "$$service" down; \
	done

reset:
	@set -e; \
	for service in $(SERVICES); do \
		$(MAKE) --no-print-directory -C "$$service" reset; \
	done

build:
	@set -e; \
	for service in $(SERVICES); do \
		$(MAKE) --no-print-directory -C "$$service" build; \
	done

deps:
	@set -e; \
	for service in $(SERVICES); do \
		$(MAKE) --no-print-directory -C "$$service" deps; \
	done

proto.generate:
	@set -e; \
	for service in $(SERVICES); do \
		$(MAKE) --no-print-directory -C "$$service" proto.generate; \
	done

fmt:
	@set -e; \
	for service in $(SERVICES); do \
		$(MAKE) --no-print-directory -C "$$service" fmt; \
	done

lint:
	@set -e; \
	for service in $(SERVICES); do \
		$(MAKE) --no-print-directory -C "$$service" lint; \
	done

test:
	@set -e; \
	for service in $(SERVICES); do \
		$(MAKE) --no-print-directory -C "$$service" test; \
	done
