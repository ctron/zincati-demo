.PHONY: all
all: update

.PHONY: update
update:
	helm dep up deployments/doppelgaenger
