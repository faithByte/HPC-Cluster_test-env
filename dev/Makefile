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
	OS=$(OS); vagrant up
	OS=$(OS); vagrant ssh master_$(NAME) -c "sudo -i"

clean:
	OS=$(OS); vagrant destroy -f

reboot:
	OS=$(OS); vagrant halt
	OS=$(OS); make vms

reb:
	OS=$(OS); vagrant halt master_$(NAME)
	OS=$(OS); make vms

sync:
	OS=$(OS); vagrant rsync-auto master_$(NAME)

re: clean vms

# inside the VMs 
check:
	@rm -rf ../HPC-Cluster/inventories
	@cp -rf ./inventories_$(OS) ../HPC-Cluster/inventories
	@cd ../HPC-Cluster && \
	ansible-playbook $(PLAYBOOK) --syntax-check && \
	ansible-playbook $(PLAYBOOK) --check

run:
	@rm -rf ../HPC-Cluster/inventories
	@cp -rf ./inventories_$(OS) ../HPC-Cluster/inventories
	@cd ../HPC-Cluster && ansible-playbook $(PLAYBOOK);

dbg:
	@rm -rf ../HPC-Cluster/inventories
	@cp -rf ./inventories_$(OS) ../HPC-Cluster/inventories
	@cd ../HPC-Cluster && ansible-playbook -vvv $(PLAYBOOK);

task:
	@rm -rf ../HPC-Cluster/inventories
	@cp -rf ./inventories_$(OS) ../HPC-Cluster/inventories
	@cd ../HPC-Cluster && ansible-playbook $(PLAYBOOK) --start-at-task="$(TASK)"

.PHONY: all vms clean re sync check run dbg task 