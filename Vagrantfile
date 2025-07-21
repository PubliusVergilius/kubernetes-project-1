# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define "control" do |control|
    control.vm.box = "bento/fedora-40"
    control.vm.box_version = "202502.21.0"
    control.vm.network "private_network", ip: "192.168.56.200"
    control.vm.network "public_network"
    control.vm.network "public_network"
    control.vm.network "forwarded_port", guest: 9090, host: 9090
    # Exposes minikube dashboard
    control.vm.synced_folder "./control_data", "/vagrant", type: "rsync", rsync_auto: true
    control.vm.provider "virtualbox" do |vb|
       vb.memory = "4096"
       vb.cpus = 4
     end
    control.vm.provision "shell", path: "provision_control.sh"
  end
end
