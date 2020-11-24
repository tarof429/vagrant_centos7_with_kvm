Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = "4"
    vb.memory = "4096"
    vb.name = "centos7"
    vb.customize ['modifyvm', :id, '--nested-hw-virt', 'on']
  end

  config.vm.provision "file", source: "create-vm.sh", destination: "create-vm.sh"
  #config.vm.provision "file", source: "mykickstart.ks", destination: "mykickstart.ks"
  config.vm.provision "file", source: "anaconda-ks.cfg", destination: "anaconda-ks.cfg"
  
  config.vm.provision "shell", inline: <<-SHELL
    yum update -y
    yum install -y vim wget pykickstart
    yum install -y qemu-kvm libvirt libvirt-python libguestfs-tools virt-install virt-viewer
    systemctl enable libvirtd
    systemctl start libvirtd

  SHELL

end