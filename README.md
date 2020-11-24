# Vagrant with CentOS 7 KVM

This project allows you to create a KVM within a CentOS VM. Vagrant is used to bring up the surroundig VM.

## Prerequisites

vagrant 2.2.14+

## Steps

1. Start the CentOS 7 VM. This may take some time while Vagrant installs packages.

```
vagrant up
```

2. Login to the VM

```
vagrant ssh
```

3. Change user to root.

```
sudo su
```

4. Run the `create_vm.sh` script. Installation is automated using kickstart, which is also installed in this VM.

```
sh ./create_vm.sh
```

At the end of install, you will need to restart the VM.

5. Login to the VM as `root/secret`.

