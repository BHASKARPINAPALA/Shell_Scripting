#!/bin/bash
 
#Based on https://gist.github.com/matthewriley/b74fa53594db1354e5593994c5d5b5a4 
 
yum -y remove git
yum -y clean packages
 
 
mkdir tempgit
cd tempgit
yum install -y autoconf cpio curl-devel expat-devel gcc gettext-devel make openssl-devel perl-ExtUtils-MakeMaker zlib-devel
wget -O v2.9.0.tar.gz https://github.com/git/git/archive/v2.9.0.tar.gz
tar -xzvf ./v2.9.0.tar.gz
cd git-2.9.0/
 
make configure
./configure --prefix=/usr/local/git
make && make install
ln -sf /usr/local/git/bin/* /usr/bin/
 
cd ..
rm -fr git-2.9.0
cd ..
rm -fr tempgit
 
echo "results"
which git
git --version
