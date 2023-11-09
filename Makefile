VERSION := $(shell poetry version | awk '{print $$2}')
all: build push

.PHONY: patch
patch:
	@echo "Bumping patch version..."
	poetry version patch

.PHONY: cv
cv:
	@echo "Current version is $(VERSION)"

.PHONY: build
build:
	@echo "Getting version"
	@echo "Building..."
	docker build -t ghcr.io/tautcius/kargo-demo-app:$(VERSION) -t ghcr.io/tautcius/kargo-demo-app:latest .
	@echo "Built complete!"

.PHONY: push
push:
	@echo "Pushing..."
	docker push ghcr.io/tautcius/kargo-demo-app:$(VERSION)
	docker push ghcr.io/tautcius/kargo-demo-app:latest
	@echo "Pushed complete!"