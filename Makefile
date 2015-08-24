.PHONY: test integration-test

test:
	rubocop
	chef exec rspec

integration-test:
	kitchen converge
