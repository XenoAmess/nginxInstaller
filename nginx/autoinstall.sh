add-apt-repository ppa:maxmind/ppa
apt update
apt install autoconf libtool libsysfs-dev libgeoip1 libgeoip-dev geoip-bin
autoreconf -vfi

mkdir /nginx/environments
cd /nginx/environments
git clone https://github.com/openssl/openssl
git clone https://github.com/madler/zlib
git clone https://github.com/nginx/nginx
git clone https://github.com/maxmind/geoip-api-c
cd /nginx/environments/geoip-api-c/data
wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz
gunzip GeoIP.dat.gz
wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz
gunzip GeoLiteCity.dat.gz
cd /nginx/environments/geoip-api-c
#./bootstrap
#libtoolize -f
#./configure
#make
#make check
#make install
ln -s /usr/local/lib/libGeoIP.so* /lib64/

cp -r /nginx/environments/nginx/ /nginx/
chmod 777 /nginx/environments/pcre-8.42/configure
cd /nginx
./auto/configure --prefix=/nginx --conf-path=/nginx/nginx.conf --with-pcre=/nginx/environments/pcre-8.42 --with-zlib=/nginx/environments/zlib --with-http_ssl_module --with-openssl=/nginx/environments/openssl --with-http_geoip_module
make
make install