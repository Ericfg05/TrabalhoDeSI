Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"

  # Sincronizar a pasta local para dentro da VM
  config.vm.synced_folder "./", "/arquivos"
  config.vm.network "private_network", ip: "192.168.56.24"

  config.vm.provision "shell", inline: <<-SHELL
 
    sudo apt-get update -y
    sudo apt-get install -y docker.io iptables
    sudo chmod 777 /arquivos
    # Configurar o Docker para desabilitar o gerenciamento de iptables
    echo '{
      "iptables": false
    }' | sudo tee /etc/docker/daemon.json

    # Reiniciar o Docker para aplicar a configuração
    sudo systemctl restart docker

    # Rodando o teste do apache2 
    sudo docker pull httpd:latest
    sudo docker run -d -p 8080:80 -v /arquivos/sites:/usr/local/apache2/htdocs/ httpd:latest

    #rodando mysql
    sudo docker pull mysql:8.0.40-debian
    sudo docker run -d -p 3306:3306 --name mysql-container -e MYSQL_ROOT_PASSWORD=123 mysql:8.0.40-debian

    #rodando o dockerfile
    sudo docker build -t httpd:latest /arquivos
    docker run -d -p 443:443 httpd:latest

    #Configurar regras do iptables
    sudo iptables -I INPUT -p tcp --dport 443 -j ACCEPT
    sudo iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
    sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
    sudo iptables -I INPUT -p tcp --dport 22 -j ACCEPT
    sudo iptables -A INPUT -p tcp -j DROP
  SHELL
end