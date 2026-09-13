.PHONY: build deps proto.generate fmt lint test run

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

