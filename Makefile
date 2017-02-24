HOST ?= all
VERBOSE ?= -v
INVENTORY = inventory

all: help

help:
	@echo "Usage:"
	@echo "	make help"

site:
	ansible-playbook $(VERBOSE) -i $(INVENTORY) --limit $(HOST) ./playbooks/site.yml
fact:
	ansible -i $(INVENTORY) $(HOST) -m setup
syncthing:
	ansible-playbook $(VERBOSE) -i $(INVENTORY) --limit $(HOST) ./playbooks/syncthing.yml
