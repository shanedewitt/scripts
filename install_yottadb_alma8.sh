#!/usr/bin/bash -x
#
# run script as root to install
# yottadb, octo, gui on Alma8 Linux
# 

# missing things
yum install -y bison cmake flex git make openssl-devel pkg-config readline-devel tar wget vim-common
dnf --enablerepo=powertools install -y libconfig-devel

# installed for yottadb
yum install -y file make gcc git curl tcsh {libconfig,libicu,ncurses,elfutils-libelf}-devel binutils ca-certificates

# RHEL/Rocky Linux
yum install -y file binutils findutils elfutils-libelf libicu wget procps-ng nano gzip ca-certificates

mkdir -p /tmp/tmp ; wget -P /tmp/tmp https://download.yottadb.com/ydbinstall.sh

cd /tmp/tmp ; chmod +x ydbinstall.sh

#sudo ./ydbinstall.sh --octo --gui --dry-run --utf8 default --verbose
sudo ./ydbinstall.sh --overwrite-existing --octo --gui --utf8 default --verbose

echo ## Help
echo ./ydbinstall.sh --help
echo
echo ## Start Yottadb
echo 'source $(pkg-config --variable=prefix yottadb)/ydb_env_set'
