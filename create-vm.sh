#!/bin/sh

ISO=centos7.iso
DOWNLOAD_LOCATION=/var/lib/libvirt/boot

if [ ! -f $DOWNLOAD_LOCATION/$ISO ]; then
    wget http://mirror.san.fastserv.com/pub/linux/centos/7.9.2009/isos/x86_64/CentOS-7-x86_64-Minimal-2009.iso -O  $DOWNLOAD_LOCATION/$ISO 
fi

# When developing the kickstart file, it's useful to not use kickstart!
virt-install \
--virt-type=kvm \
--name centos7 \
--ram 2048 \
--vcpus=1 \
--os-variant=centos7.0 \
--graphics=none \
--disk path=/var/lib/libvirt/images/centos7.qcow2,size=30,bus=virtio,format=qcow2 \
--location=$DOWNLOAD_LOCATION/$ISO \
--initrd-inject /home/vagrant/anaconda-ks.cfg \
--extra-args "console=tty0 console=ttyS0 ks=file:/anaconda-ks.cfg"

# If installation gets stuck, comment out the last two command-line arguments
# specfying the kickstart file and specify the following line instead.
#--extra-args "console=ttyS0" -v