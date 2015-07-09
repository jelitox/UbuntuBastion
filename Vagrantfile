# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    config.vm.box = "ubuntu/trusty32"
    config.vm.box_check_update = true

    config.vm.define "ServerBastion" do |vapro|
    end

    if Vagrant.has_plugin?("vagrant-hostmanager")
        config.hostmanager.enabled = true
        config.hostmanager.manage_host = true
        config.hostmanager.ignore_private_ip = false
        config.hostmanager.include_offline = false
    end

    config.vm.hostname = "juegaenlinea.net"

    config.vm.network :private_network, ip: "127.0.0.10"
    config.vm.network :forwarded_port, guest: 80, host: 8000

    config.vm.provider :virtualbox do |vb|
        vb.name = "juegaenlinea.net"
        # Set server cpus
        vb.customize ["modifyvm", :id, "--cpus", 1]
        # ServerBastiont server memory
        vb.customize ["modifyvm", :id, "--memory", 256]

        vb.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000]
    end
end
