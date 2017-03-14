
echo "Installing Epel repos and CentOS-7 missing packages"
sudo yum -y install epel-release net-tools htop vim git

sudo yum install -y python-pip python-devel build-essential libffi-dev libssl-dev git openssl-devel  libffi-devel

sudo pip install --upgrade setuptools

sudo pip install ansible 





sudo yum -y upgrade
