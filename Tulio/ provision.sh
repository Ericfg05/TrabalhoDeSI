#!/bin/bash

# Atualizar pacotes
sudo apt-get update -y

# Instalar o Fail2Ban
sudo apt-get install -y fail2ban

# Criar arquivo de configuração local do Fail2Ban
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

# Configurar Fail2Ban para banir após 2 tentativas falhadas em 30 segundos
sudo sed -i 's/^#maxretry = 3/maxretry = 2/' /etc/fail2ban/jail.local
sudo sed -i 's/^#findtime = 600/findtime = 30/' /etc/fail2ban/jail.local
sudo sed -i 's/^#bantime = 600/bantime = 30/' /etc/fail2ban/jail.local

# Reiniciar o Fail2Ban para aplicar as configurações
sudo systemctl restart fail2ban

# Instalar o Docker
sudo apt-get install -y docker.io

# Sincronizar a pasta local para dentro da VM
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

sudo docker pull mysql:8.0.40-debian
sudo docker run -d -p 3306:3306 --name mysql-container -e MYSQL_ROOT_PASSWORD=123 mysql:8.0.40-debian

sudo docker build -t httpd:latest /arquivos
docker run -d -p 443:443 httpd:latest

# Configurar regras do iptables
    #Configurar regras do iptables
    sudo iptables -I INPUT -p tcp --dport 443 -j ACCEPT
    sudo iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
    sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
    sudo iptables -I INPUT -p tcp --dport 22 -j ACCEPT
    sudo iptables -A INPUT -p tcp -j DROP
