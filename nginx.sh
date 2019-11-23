#!/bin/bash
#安装nginx脚本
echo "------------------------"
echo "安装依赖库------------>1"
echo "安装nginx------------->2"
echo "------------------------"

read -p "请选择对应数字[1/2]=>" key

lib_nginx(){
        #yum -y install pcre-devel zlib-devel openssl-devel
        useradd -r -s /sbin/nologin www
}

nginx(){
        tar -zxf nginx-1.16.0.tar.gz
        cd nginx-1.16.0
        ./configure  --prefix=/usr/local/nginx --user=www --group=www --with-http_ssl_module --with-http_stub_status_module --with-http_realip_module
        make && make install
}

case $key in
        1)
        lib_nginx
        ;;
        2)
        nginx
        ;;
esac
