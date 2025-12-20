MAKEFLAGS += --silent --ignore-errors

PLAYBOOK = playbook.yml

DIR ?= Debian/

## vagrant
vms:
	cd $(DIR) && make vms

master:
	cd $(DIR) && make master

clean:
	cd $(DIR) && make clean

re:
	cd $(DIR) && make re

# inside the VMs 
check:
	@cp -rf ./$(DIR)/inventories ../HPC-Cluster
	@cd ../HPC-Cluster && \
	ansible-playbook $(PLAYBOOK) --syntax-check && \
	ansible-playbook $(PLAYBOOK) --check

run:
	@cp -rf ./$(DIR)/inventories ../HPC-Cluster
	@cd ../HPC-Cluster && ansible-playbook $(PLAYBOOK);

dbg:
	@cp -rf ./$(DIR)/inventories ../HPC-Cluster
	@cd ../HPC-Cluster && ansible-playbook -vvv $(PLAYBOOK);

task:
	@cd ../HPC-Cluster && ansible-playbook $(PLAYBOOK) --start-at-task="$(TASK)"

.PHONY: all vms master clean re run check 