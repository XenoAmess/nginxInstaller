cd /nginx/environments/openssl
rm -rf *
git clone https://github.com/openssl/openssl.git
cd /nginx/environments/zlib
rm -rf *
git clone https://github.com/madler/zlib
cd /nginx/temp
rm -rf *
git clone https://github.com/nginx/nginx
cd /nginx
mv /nginx/temp/* /nginx/
./auto/configure --prefix=/nginx --conf-path=/nginx/nginx.conf --with-openssl=/nginx/environments/openssl --with-http_ssl_module --with-pcre=/nginx/environments/pcre-8.42 --with-zlib=/nginx/environments/zlib
make install