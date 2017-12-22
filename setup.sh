# AMAZON
# ssh -i rheltest.pem ec2-user@ec2-18-217-82-69.us-east-2.compute.amazonaws.com

# ssh singularity001@pfacdmlr01.westeurope.cloudapp.azure.com


# Create user
sudo useradd jwaage
sudo passwd jwaage
sudo usermod -aG wheel jwaage

sudo useradd mac
sudo passwd mac

sudo useradd emd
sudo passwd emd


# Install helper packages
sudo yum -y install emacs
sudo yum -y install wget

# Enable EPEL
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum -y install epel-release-latest-7.noarch.rpm
sudo yum repolist

# Install additional helper packages
sudo yum -y install htop
sudo yum -y install screen

##

# Install R
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/texlive-epsf-doc-svn21461.2.7.4-38.el7.noarch.rpm
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/texlive-epsf-svn21461.2.7.4-38.el7.noarch.rpm
wget http://mirror.centos.org/centos/7/os/x86_64/Packages/texinfo-tex-5.1-4.el7.x86_64.rpm
sudo yum localinstall -y texlive-epsf-doc-svn21461.2.7.4-38.el7.noarch.rpm
sudo yum localinstall -y texlive-epsf-svn21461.2.7.4-38.el7.noarch.rpm
sudo yum localinstall -y texinfo-tex-5.1-4.el7.x86_64.rpm

sudo yum install -y R

# Python
sudo yum install gcc openssl-devel bzip2-devel
sudo yum install -y python34.x86_64

# Rstudio server
wget https://download2.rstudio.org/rstudio-server-rhel-1.1.383-x86_64.rpm
sudo yum install --nogpgcheck rstudio-server-rhel-1.1.383-x86_64.rpm
rstudio-server status

# Anaconda
sudo yum install bzip2
wget https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh
sudo bash Anaconda3-5.0.1-Linux-x86_64.sh 
# Install in /opt/anaconda
./jupyter notebook --generate-config
emacs /home/ec2-user/.jupyter/jupyter_notebook_config.py

#c.NotebookApp.allow_origin = '*'
#c.NotebookApp.ip = '0.0.0.0' 

# Start jupyter
/opt/anaconda/bin/jupyter notebook --ip 172.31.20.152 --port 8888 --notebook-dir ~

# Firewall
sudo firewall-cmd --permanent --zone=public --add-port=8787/tcp
sudo firewall-cmd --reload