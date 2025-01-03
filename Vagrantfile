Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"

  # Sincronizar a pasta local para dentro da VM
  config.vm.synced_folder "./", "/arquivos"
  config.vm.network "private_network", type: "dhcp", ip: "192.168.56.24"

  config.vm.provision "shell", inline: <<-SHELL
    # Atualizar pacotes e instalar dependências
    sudo apt-get update -y
    sudo apt-get install -y docker.io docker-compose iptables

    # Configurar o Docker para desabilitar o gerenciamento de iptables
    echo '{
      "iptables": false
    }' | sudo tee /etc/docker/daemon.json

    # Reiniciar o Docker para aplicar a configuração
    sudo systemctl restart docker

    # Rodar os contêineres manualmente
    sudo docker pull httpd:latest
    #sudo docker run -d -p 8080:80 -v /arquivos:/usr/local/apache2/htdocs/ httpd:latest
    sudo docker run -d -p 7070:80 -v /arquivos:/usr/local/apache2/htdocs/ httpd:latest


    sudo docker pull mysql:8.0.40-debian
    sudo docker run -d -p 3306:3306 --name mysql-container -e MYSQL_ROOT_PASSWORD=123 mysql:8.0.40-debian
    
  docker run -d \
  -p 8080:80 \
  --name apache-ssl-container \
  -v /path/to/certbot/config:/etc/letsencrypt \
  -v /path/to/certbot/www:/var/www/certbot \
  --env "DOMAINS="192.168.56.24" \
  --env "EMAIL=eric.ferreira@estudante.ifgoiano.edu.br" \
  certbot/certbot \
  bash -c "certbot certonly --standalone --preferred-challenges http -d \$DOMAINS --email \$EMAIL --agree-tos --non-interactive && apache2ctl -D FOREGROUND"

    
    # Configurar regras do iptables
    sudo iptables -I INPUT -p tcp --dport 8080 -j ACCEPT
    sudo iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
    sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
    sudo iptables -I INPUT -p tcp --dport 22 -j ACCEPT
    sudo iptables -A INPUT -p tcp -j DROP


    SHELL
end
