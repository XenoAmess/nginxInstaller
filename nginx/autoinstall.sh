apt install autoconf
autoreconf -vfi

cd /nginx/environments
git clone https://github.com/openssl/openssl.git
git clone https://github.com/madler/zlib
git clone https://github.com/nginx/nginx
git clone https://github.com/maxmind/geoip-api-c
cd /nginx

cp -r /nginx/environments//nginx/. /nginx/

chmod 777 /nginx/environments/pcre-8.42/configure
./auto/configure --prefix=/nginx --conf-path=/nginx/nginx.conf --with-pcre=/nginx/environments/pcre-8.42 --with-zlib=/nginx/environments/zlib --with-http_ssl_module --with-openssl=/nginx/environments/openssl --with-http_geoip_module --with-geoip=/nginx/environments/geoip-api-c
make install