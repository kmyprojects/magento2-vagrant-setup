# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

Vagrant.configure("2") do |config|

  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.

  config.vm.box = "ubuntu/trusty64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

    config.vm.network :forwarded_port, guest: 80, host: 8108
    config.vm.network :forwarded_port, guest: 3306, host: 3108

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.

   config.vm.network "private_network", ip: "192.168.33.108"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Detecting and Defining Host Operating System

  module OS
        def OS.windows?
            (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
        end

        def OS.mac?
            (/darwin/ =~ RUBY_PLATFORM) != nil
        end

        def OS.unix?
            !OS.windows?
        end

        def OS.linux?
            OS.unix? and not OS.mac?
        end
    end

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.

  if OS.windows?
      puts "Vagrant launched from windows."
      config.vm.synced_folder "./", "/var/www/html", mount_options: ['dmode=777','fmode=777'], :nfs => true
  elsif OS.mac?
      puts "Vagrant launched from mac."
      config.vm.synced_folder "/Users/Kanaka/repos/magento2_Vagrant", "/var/www/html", id: "vagrant-root", owner: "vagrant", group: "www-data", mount_options: ["dmode=775,fmode=664"]
  elsif OS.unix?
      puts "Vagrant launched from unix."
      config.vm.synced_folder "./", "/var/www/html", :nfs => { :mount_options => ["dmode=777","fmode=777"] }
  elsif OS.linux?
      puts "Vagrant launched from linux."
      config.vm.synced_folder "./", "/var/www/html", :nfs => { :mount_options => ["dmode=777","fmode=777"] }
  else
      puts "Vagrant launched from unknown platform."
      config.vm.synced_folder "./", "/var/www/html", :nfs => { :mount_options => ["dmode=777","fmode=777"] }
  end

  config.vm.provider :virtualbox do |vb|
    vb.gui = true
  end

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # For VirtualBox:

  config.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
        vb.customize ["modifyvm", :id, "--cpuexecutioncap", "90"]
        vb.customize ["modifyvm", :id, "--memory", "2048"]
        vb.customize ["modifyvm", :id, "--cpus", 1]
    end

  #

  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "2048"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script.

  config.vm.provision :shell, path: "setup.sh"

  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL

end
