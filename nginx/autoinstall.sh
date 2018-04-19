apt install autoconf
autoreconf -vfi

cd /nginx/environments
git clone https://github.com/openssl/openssl.git

cd /nginx/environments
git clone https://github.com/madler/zlib

cd /nginx
git clone https://github.com/nginx/nginx
cd /nginx
mv /nginx/nginx/* /nginx/
rm -rf /nginx/nginx

chmod 777 /nginx/environments/pcre-8.42/configure
./auto/configure --prefix=/nginx --conf-path=/nginx/nginx.conf --with-openssl=/nginx/environments/openssl --with-http_ssl_module --with-pcre=/nginx/environments/pcre-8.42 --with-zlib=/nginx/environments/zlib
make install