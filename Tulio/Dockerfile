FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y apache2 ssl-cert

COPY ./apache2.conf /etc/apache2/apache2.conf
COPY ./default-ssl.conf /etc/apache2/sites-available/default-ssl.conf
COPY ./ssl /etc/apache2/ssl
COPY ./ports.conf /etc/apache2/ports.conf
COPY ./sites /var/www/html

RUN a2enmod ssl
# Habilitar o site SSL
RUN a2ensite default-ssl.conf

# Expor as portas
EXPOSE 443

# Definir o comando de inicialização
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]