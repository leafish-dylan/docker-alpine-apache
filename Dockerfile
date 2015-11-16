FROM gliderlabs/alpine

RUN apk-install php-apache2 curl php-cli php-json php-phar php-openssl && \
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
mkdir /app && chown -R apache:apache /app && \
sed -i 's#^DocumentRoot ".*#DocumentRoot "/app"#g' /etc/apache2/httpd.conf && \
sed -i 's#AllowOverride none#AllowOverride All#' /etc/apache2/httpd.conf && \
echo "Success"

EXPOSE 80

# VOLUME /app
WORKDIR /app

ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["-DFOREGROUND"]