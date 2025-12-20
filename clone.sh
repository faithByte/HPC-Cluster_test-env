
# "RedHat/Debian Mirror Server" are made using the same vagrant file in dirs [Debian, RedHat] 
# with:
# vm.box_version = "4.3.12"
# vm.box = "generic/rhel9" | "generic/debian12"
# + we've run the role mirror-server

vagrant package --output master_rhel9.box --base "RedHat Mirror Server"
vagrant box add master_rhel9 ./master_rhel9.box

vagrant package --output master_debian.box --base "Debian Mirror Server"
vagrant box add master_debian ./master_debian.box