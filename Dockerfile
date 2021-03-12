# docker build -t misaelgomes/tengine-php74 .
# docker run -d -p 3142:3142 misaelgomes/eg_apt_cacher_ng
# acessar localhost:3142 copiar proxy correto e colar abaixo em Acquire
# docker run -d -p 80:80 misaelgomes/tengine-php74

FROM misaelgomes/tengine

RUN addgroup --system --gid 101 nginx
RUN adduser --system --disabled-login --ingroup nginx --no-create-home --home /nonexistent --gecos "nginx user" --shell /bin/false --uid 101 nginx


#https://docs.docker.com/engine/examples/apt-cacher-ng/
RUN echo 'Acquire::http { Proxy "http://172.17.0.2:3142"; };' >> /etc/apt/apt.conf.d/01proxy

VOLUME ["/var/cache/apt-cacher-ng"]

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Sao_Paulo

# add-apt-repository depend software-properties-common
RUN apt-get update && apt-get install -y software-properties-common \
                   && add-apt-repository -y ppa:maxmind/ppa 

RUN  apt-get update \
                && apt-get install -y tzdata apt-utils locales --fix-missing \
                && apt-get install -y \
                nginx-common libmaxminddb0 libmaxminddb-dev mmdb-bin nano \
                gcc flex make bison build-essential pkg-config g++ libtool automake autoconf git \
                libcurl4-openssl-dev \
                libatomic-ops-dev \
                libjemalloc-dev libjemalloc2 \
                libxml2-dev \
                libssl-dev \
                zlib1g \
                webp libwebp-dev devscripts \
                optipng \
                gifsicle \
                jpegoptim \
                ca-certificates \
                openssl \
                unzip \
                libc-dev \
                zlib1g-dev \
                curl \
                libxslt-dev \
                libgd-tools \
                libgd3 \
                libgd-dev \
                libgeoip-dev --fix-missing

     


EXPOSE 80 443

STOPSIGNAL SIGTERM
#php

RUN apt-get install -y php7.4-xmlrpc php7.4-fpm \
        php7.4-opcache php7.4-gd php7.4-zip php7.4-curl \
        php7.4-mbstring php7.4-redis php7.4-xml php7.4-soap \
        php7.4-dev php7.4-imap php7.4-pdo php7.4-mysql php7.4-mysqli \
        php7.4-bcmath php7.4-intl php7.4-xsl \
        php7.4-memcached  php7.4-imagick 

RUN apt-get install -y php-pear --fix-missing
RUN pecl channel-update pecl.php.net
RUN echo yes | pecl install lzf
#RUN echo yes | pecl install vips
RUN echo yes | pecl install datadog_trace

RUN apt-get install -y imagemagick


#limpeza


RUN echo "America/Sao_Paulo" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata
RUN apt-get install ntp -y --fix-missing
RUN echo 'server 0.centos.pool.ntp.org' >> /etc/ntp.conf
RUN echo 'server 1.centos.pool.ntp.org' >> /etc/ntp.conf
RUN echo 'server 2.centos.pool.ntp.org' >> /etc/ntp.conf
RUN service ntp restart

RUN apt-get install cron -y --fix-missing

RUN curl -s https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

RUN apt-get upgrade -y

RUN apt-get remove -y gcc flex make bison build-essential pkg-config \
        g++ libtool automake autoconf
RUN apt-get remove --purge --auto-remove -y \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*
        
RUN rm -fr /tmp/*

RUN mkdir -p /var/cache/nginx
RUN mkdir -p /etc/nginx/extras
RUN nginx -t

CMD service php7.4-fpm start && nginx -g 'daemon off;'
