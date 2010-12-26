#!/bin/sh
cd $HOME

# install important tools
sudo apt-get install xchat
sudo apt-get install curl
sudo apt-get install gnome-do
sudo apt-get install git
sudo apt-get install meld
sudo apt-get install mercurial

# install important libraries
# needed for PIL and mysql-python
sudo apt-get install libssl-dev
sudo apt-get install libjpeg62 libjpeg-dev
sudo apt-get install libfreetype6 libfreetype6-dev
sudo apt-get install libmysqlclient-dev python2.6-dev

# install python2.7
sudo apt-get install python2.7
sudo apt-get install python2.7-dev

# install virtualenvwrapper
sudo apt-get install python-setuptools
sudo easy_install virtualenv
sudo apt-get install python-pip
sudo pip install virtualenvwrapper
export WORKON_HOME=~/Envs
mkdir -p $WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh
echo "export WORKON_HOME=~/Envs" >> .bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> .bashrc

# install node.js
cd $HOME/Downloads
wget http://nodejs.org/dist/node-v0.3.2.tar.gz
tar -zxvf node-v0.3.2.tar.gz
cd node-v0.3.2
./configure
make
sudo make install
cd ..
rm -rf node*
sudo chown -R $USER /usr/local/{share/man,bin,lib/node}
curl http://npmjs.org/install.sh | sh
cd $HOME/Downloads
rm -rf npm

# install databases
sudo apt-get install couchdb
sudo apt-get install mysql-server

# install crunchyfrog
cd $HOME
mkdir opt
cd opt
hg clone http://crunchyfrog.googlecode.com/hg/ crunchyfrog
sudo pip install configobj
sudo pip install sqlparse
cd $HOME
mkdir bin
cd bin
ln -s $HOME/opt/crunchyfrog/crunchyfrog
cd $HOME
echo "export PATH=$PATH:/home/martin/bin" >> .bashrc

# install SASS & csstidy
sudo apt-get install ruby
sudo apt-get install rubygems1.8
sudo gem install haml
sudo apt-get install csstidy
