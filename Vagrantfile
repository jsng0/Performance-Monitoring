# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.define "host" do |host|
    host.vm.box = "chef/centos-6.5"
    host.vm.network "private_network", ip: "192.168.50.4"
    config.vm.hostname = "host"
    host.vm.network "forwarded_port", guest: 80, host:8000
    host.vm.provision :shell, path: "hostconf.sh"
  end

  config.vm.define "m1" do |m1|
    m1.vm.box = "chef/centos-6.5"
    m1.vm.network "private_network", ip: "192.168.50.5"
    m1.vm.hostname = "m1"
    m1.vm.provision :shell, path: "clientconf.sh"
    m1.vm.provision :shell, inline: "sudo crontab /vagrant/crontabclient.txt"
  end

  config.vm.define "m2" do |m2|
    m2.vm.box = "chef/centos-6.5"
    m2.vm.network "private_network", ip: "192.168.50.6"
    m2.vm.hostname = "m2"
    m2.vm.provision :shell, path: "clientconf.sh"
    m2.vm.provision :shell, inline: "sudo crontab /vagrant/crontabclient.txt"
  end

  config.vm.define "m3" do |m3|
    m3.vm.box = "chef/centos-6.5"
    m3.vm.network "private_network", ip: "192.168.50.7"
    m3.vm.hostname = "m3"
    m3.vm.provision :shell, path: "clientconf.sh"
    m3.vm.provision :shell, inline: "sudo crontab /vagrant/crontabclient.txt"
  end

  config.vm.define "m4" do |m4|
    m4.vm.box = "chef/centos-6.5"
    m4.vm.network "private_network", ip: "192.168.50.8"
    m4.vm.hostname = "m4"
    m4.vm.provision :shell, path: "clientconf.sh"
    m4.vm.provision :shell, inline: "sudo crontab /vagrant/crontabclient.txt"
  end

end
