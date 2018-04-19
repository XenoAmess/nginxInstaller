mkdir /nginx/environments
cd /nginx/environments
git clone https://github.com/openssl/openssl.git

mkdir /nginx/environments
cd /nginx/environments
git clone https://github.com/madler/zlib

mkdir /nginx
cd /nginx
git clone https://github.com/nginx/nginx
cd /nginx
mv /nginx/nginx/* /nginx/
rm -rf /nginx/nginx

./auto/configure --prefix=/nginx --conf-path=/nginx/nginx.conf --with-openssl=/nginx/environments/openssl --with-http_ssl_module --with-pcre=/nginx/environments/pcre-8.42 --with-zlib=/nginx/environments/zlib
make install