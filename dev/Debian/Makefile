MAKEFLAGS += --silent --ignore-errors

PLAYBOOK = playbook.yml

## vagrant
vms:
	vagrant up
	vagrant ssh master -c "sudo -i"

master:
	vagrant up master
	vagrant ssh master -c "sudo -i"

clean:
	vagrant destroy -f

re: clean vms

.PHONY: all vms master clean re 