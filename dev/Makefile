MAKEFLAGS += --silent --ignore-errors

PLAYBOOK = playbook.yml

ifndef OS
	NAME := deb
	OS := Debian
else
	OS := RedHat 
	NAME := rhel
endif

## vagrant
vms:
	vagrant up
	vagrant ssh master_$(NAME) -c "sudo -i"

clean:
	vagrant destroy -f

re: clean vms

# inside the VMs 
check:
	@cp -rf ./inventories_$(OS) ../HPC-Cluster/inventories
	@cd ../HPC-Cluster && \
	ansible-playbook $(PLAYBOOK) --syntax-check && \
	ansible-playbook $(PLAYBOOK) --check

run:
	@cp -rf ./inventories_$(OS) ../HPC-Cluster/inventories
	@cd ../HPC-Cluster && ansible-playbook $(PLAYBOOK);

dbg:
	@cp -rf ./inventories_$(OS) ../HPC-Cluster/inventories
	@cd ../HPC-Cluster && ansible-playbook -vvv $(PLAYBOOK);

task:
	@cp -rf ./inventories_$(OS) ../HPC-Cluster/inventories
	@cd ../HPC-Cluster && ansible-playbook $(PLAYBOOK) --start-at-task="$(TASK)"

.PHONY: all vms clean re run check 