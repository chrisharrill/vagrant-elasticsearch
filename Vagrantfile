Vagrant.configure("2") do |config|  
    config.vm.box = "ubuntu/xenial64"
    config.vm.network "private_network", ip: "192.168.50.10"
    config.vm.hostname = "dev-es"
    config.vm.synced_folder "./config", "/vagrant_data"
    config.vm.provision :shell, path: "provision.sh", privileged: false
end