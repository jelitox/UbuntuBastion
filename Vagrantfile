# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    config.vm.box = "ubuntu/trusty32"
    config.vm.box_check_update = true

    config.vm.define "ServerBastion" do |vapro|
    end

    config.vm.hostname = "bastion"
    config.vm.network :private_network, ip: "10.10.10.11"
    config.vm.network :forwarded_port, guest: 80, host: 8000,auto_correct: true
    config.vm.network :forwarded_port, guest: 3306, host: 3306,auto_correct: true

    config.vm.provider :virtualbox do |vb|
        vb.name = "ubuntuBastion"
        # Set server cpus
        vb.customize ["modifyvm", :id, "--cpus", 1]
        # ServerBastiont server memory
        vb.customize ["modifyvm", :id, "--memory", 256]

        vb.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000]
    end

    config.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update && sudo apt-get install -qq curl unzip git-core ack-grep software-properties-common build-essential dbus nano aptitude
      cd /vagrant && sudo ./init.sh
    SHELL


end
