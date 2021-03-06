FROM debian:buster-slim

ARG PHP_VERSION=7.3
ARG RUNPKGS="software-properties-common \
             apt-transport-https \
             vim \
             git \
             apache2 \
             libapache2-mod-fcgid \
             libfcgi-bin \
             mariadb-client \
             php$PHP_VERSION \
             php$PHP_VERSION-cli \
             php$PHP_VERSION-common \
             php$PHP_VERSION-curl \
             php$PHP_VERSION-fpm \
             php$PHP_VERSION-json \
             php$PHP_VERSION-mysql \
             php$PHP_VERSION-opcache \
             php$PHP_VERSION-readline \
             php$PHP_VERSION-xml \
             php$PHP_VERSION-xsl \
             php$PHP_VERSION-gd \
             php$PHP_VERSION-intl \
             php$PHP_VERSION-bz2 \
             php$PHP_VERSION-bcmath \
             php$PHP_VERSION-imap \
             php$PHP_VERSION-gd \
             php$PHP_VERSION-mbstring \
             php$PHP_VERSION-pgsql \
             php$PHP_VERSION-sqlite3 \
             php$PHP_VERSION-xmlrpc \
             php$PHP_VERSION-zip  \
             php$PHP_VERSION-odbc \
             php$PHP_VERSION-snmp \
             php$PHP_VERSION-interbase \
             php$PHP_VERSION-ldap \
             php$PHP_VERSION-tidy \
            #  php-tcpdf \ #required to generate PDFs
             php-redis \
             php-imagick"



COPY ./scripts/docker-entrypoint.sh /
RUN apt-get update                         && \
    apt-get --no-install-recommends install -y $RUNPKGS && \
    rm -rf /var/lib/apt/lists/* &&  \
    echo $PHP_VERSION > /PHP_VERSION && \
    rm /var/www/html/* && \
    git  clone --recursive https://github.com/uni4online/openSIS-Responsive-Design.git /var/www/html && \
    chown -R www-data.www-data /var/www/html && \
    a2enmod proxy_fcgi setenvif && \
    a2enconf php$PHP_VERSION-fpm  && \
    apt-get -y remove git && \
    apt-get -y autoremove && \
    apt-get -y clean 



ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 80
