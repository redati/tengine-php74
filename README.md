# OS
Ubuntu 20.04

# Tengine (NGINX)

<pre>
nginx -V
Tengine version: Tengine/2.3.2
nginx version: nginx/1.17.3
built by gcc 9.3.0 (Ubuntu 9.3.0-17ubuntu1~20.04) 
built with OpenSSL 1.1.1f  31 Mar 2020
TLS SNI support enabled
configure arguments: 
    --prefix=/etc/nginx 
    --sbin-path=/usr/sbin/nginx 
    --modules-path=/usr/lib/nginx/modules 
    --conf-path=/etc/nginx/nginx.conf 
    --error-log-path=/var/log/nginx/error.log 
    --http-log-path=/var/log/nginx/access.log 
    --pid-path=/var/run/nginx.pid 
    --lock-path=/var/run/nginx.lock 
    --http-client-body-temp-path=/var/cache/nginx/client_temp 
    --http-proxy-temp-path=/var/cache/nginx/proxy_temp 
    --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp 
    --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp 
    --http-scgi-temp-path=/var/cache/nginx/scgi_temp 
    --user=nginx 
    --group=nginx 
    --with-libatomic 
    --with-pcre-jit 
    --with-jemalloc 
    --with-http_ssl_module 
    --with-http_realip_module 
    --with-http_addition_module 
    --with-http_sub_module 
    --with-http_dav_module 
    --with-http_flv_module 
    --with-http_mp4_module 
    --with-http_gunzip_module 
    --with-http_gzip_static_module 
    --with-http_random_index_module 
    --with-http_secure_link_module 
    --with-http_stub_status_module 
    --with-http_auth_request_module 
    --with-http_xslt_module 
    --with-http_image_filter_module 
    --with-threads 
    --with-stream 
    --with-stream_ssl_module 
    --with-stream_ssl_preread_module 
    --with-stream_realip_module 
    --with-http_slice_module 
    --with-mail 
    --with-mail_ssl_module 
    --with-compat 
    --with-file-aio 
    --with-http_v2_module 
    --with-ipv6 
    --with-debug 
    --add-module=modules/ngx_http_upstream_check_module 
    --add-module=modules/ngx_slab_stat 
    --add-module=modules/ngx_http_user_agent_module 
    --add-module=modules/ngx_http_upstream_vnswrr_module 
    --add-module=modules/ngx_http_upstream_dynamic_module 
    --add-module=modules/ngx_http_upstream_consistent_hash_module 
    --add-module=modules/ngx_http_sysguard_module 
    --add-module=modules/ngx_http_slice_module 
    --add-module=modules/ngx_http_upstream_session_sticky_module 
    --add-module=modules/ngx_devel_kit-master 
    --add-module=modules/set-misc-nginx-module-master 
    --add-module=modules/ngx_http_geoip2_module-master 
    --add-module=modules/headers-more-nginx-module-master 
    --add-module=modules/naxsi-master/naxsi_src 
    --with-pcre=/usr/src/pcre-8.44 
    --with-cc-opt='-Wp,-D_FORTIFY_SOURCE=2,-fexceptions,-DTCP_FASTOPEN=23,--param=ssp-buffer-size=4'
</pre>

#PHP 7.4

<pre>

apt-get install -y php7.4-xmlrpc php7.4-fpm \
        php7.4-opcache php7.4-gd php7.4-zip php7.4-curl \
        php7.4-mbstring php7.4-redis php7.4-xml php7.4-soap \
        php7.4-dev php7.4-imap php7.4-pdo php7.4-mysql php7.4-mysqli \
        php7.4-bcmath php7.4-intl php7.4-xsl php7.4-apcu \
        php7.4-memcached  php7.4-imagick 

apt-get install -y libvips libvips-dev 
apt-get install -y php-pear
pecl channel-update pecl.php.net
echo yes | pecl install lzf
echo yes | pecl install vips
echo yes | pecl install datadog_trace

</pre>
