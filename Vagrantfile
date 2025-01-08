Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"

  # Sincronizar a pasta local para dentro da VM
  config.vm.synced_folder "./", "/arquivos"
  config.vm.network "private_network", ip: "192.168.56.24"

  config.vm.provision "shell", path: "provision.sh"
end