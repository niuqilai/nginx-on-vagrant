mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup`date '+%Y%m%d_%H%M%S'` 
curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
yum clean all
yum makecache

#get deps to compile python modules
yum -y install gcc automake autoconf libtool make
yum -y install gcc
gcc -v
yum install -y centos-release-scl
yum install -y devtoolset-7-gcc*
scl enable devtoolset-7 bash
gcc -v

cd /usr/local/src/
wget http://download.redis.io/releases/redis-6.0.6.tar.gz
tar xzf redis-6.0.6.tar.gz

cd /usr/local/src/redis-6.0.6 && make

echo "finish redis server build "
