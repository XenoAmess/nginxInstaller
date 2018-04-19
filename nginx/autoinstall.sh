mkdir /nginx/environments/openssl
cd /nginx/environments/openssl
git clone https://github.com/openssl/openssl.git

mkdir /nginx/environments/zlib
cd /nginx/environments/zlib
git clone https://github.com/madler/zlib

mkdir /nginx/temp
cd /nginx/temp
git clone https://github.com/nginx/nginx
cd /nginx
mv /nginx/temp/* /nginx/
./auto/configure --prefix=/nginx --conf-path=/nginx/nginx.conf --with-openssl=/nginx/environments/openssl --with-http_ssl_module --with-pcre=/nginx/environments/pcre-8.42 --with-zlib=/nginx/environments/zlib
make install