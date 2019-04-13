#! /bin/bash
#centos7 netdata安装脚本

yum install git -y
git clone https://github.com/firehol/netdata.git --depth=1

rpm -ivh http://mirrors.ustc.edu.cn/epel/epel-release-latest-7.noarch.rpm
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
sed -i.bak 's/$releasever/7/g' /etc/yum.repos.d/CentOS-Base.repo 
sed -i 's/gpgcheck=1/gpgcheck=0/g' /etc/yum.repos.d/CentOS-Base.repo
yum install autoconf automake curl gcc git libmnl-devel libuuid-devel lm-sensors make MySQL-python nc pkgconfig python python-psycopg2 PyYAML zlib-devel -y
cd netdata/
./netdata-installer.sh --install /opt/
# http://this.machine.ip:19999/
