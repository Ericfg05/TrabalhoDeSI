FROM httpd:latest

EXPOSE 80

COPY arquivos /arquivos
COPY arquivos/default-ssl /etc/apache2/sites-available/
COPY arquivos/apache.key /etc/apache2/ssl/
COPY arquivos/apache.crt /etc/apache2/ssl/
COPY arquivos/ports.conf /etc/apache2/
COPY arquivos/ports.conf /etc/apache2/



RUN a2ensite default-ssl.conf

CMD ["httpd-foreground"]