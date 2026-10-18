Vagrant.configure("2") do |config|

  config.vm.box = "debian/bookworm64"

  config.vm.hostname = "servidor-debian-angel"

  config.vm.network "private_network", ip: "192.168.56.10", virtualbox__intnet: "red-laboratorio"

  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  config.vm.provision "shell", path: "setup_apache.sh"
end
