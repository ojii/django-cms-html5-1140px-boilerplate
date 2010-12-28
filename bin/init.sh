#!/usr/bin/env bash
echo "Installing all needed modules into a virtualenv"
echo "Please enter the name of your virtualenv: "
read virtualenvname
virtualenv --no-site-packages $virtualenvname
cd $virtualenvname
. bin/activate
pip install Django
pip install PIL
pip install mysql-python
pip install south
pip install BeautifulSoup
pip install -e git://github.com/divio/django-cms.git#egg=django-cms
pip install -e git://github.com/dziegler/django-css.git#egg=compressor
pip install -e git://github.com/SmileyChris/easy-thumbnails.git#egg=easy-thumbnails
pip install -e git://github.com/stefanfoulis/django-filer.git@master#egg=filer
pip install -e git://github.com/ojii/django-multilingual-ng.git#egg=multilingual
echo "Updating git submodules..."
git submodule update --init --recursive

echo "Creating static folders..."
mkdir ./webapps/static
mkdir ./webapps/static/img
mkdir ./webapps/static/css
mkdir ./webapps/static/js
touch ./webapps/static/css/styles.sass

echo "Copying the parts of html5-boilerplate that we need..."
cp ./lib/html5-boilerplate/404.html ./webapps/django/project/templates/404.html
cp ./lib/html5-boilerplate/apple-touch-icon.png ./webapps/static/img/apple-touch-icon.png
cp ./lib/html5-boilerplate/favicon.ico ./webapps/static/img/favicon.ico
cp ./lib/html5-boilerplate/robots.txt ./webapps/static/robots.txt
cp -r ./lib/html5-boilerplate/js ./webapps/static/
cp -r ./lib/html5-boilerplate/css ./webapps/static/

echo "Copying the parts of 1140px css grid that we need..."
cp ./lib/1140px/1140.css ./webapps/static/css/1140.css
cp ./lib/1140px/smallerscreen.css ./webapps/static/css/smallerscreen.css
cp ./lib/1140px/mobile.css ./webapps/static/css/mobile.css
cp ./lib/1140px/ie.css ./webapps/static/css/ie.css

echo "Splitting up html5-boilerplate css..."
SPLIT=`grep -n "/* Primary Styles" ./webapps/static/css/style.css | awk -F":" '{ print $1 }'`
SPLITHEAD=`expr $SPLIT - 1`
SPLITTAIL=`expr $SPLIT + 3`
head --lines=$SPLITHEAD ./webapps/static/css/style.css > ./webapps/static/css/boilerplate.css
tail -n +$SPLITTAIL ./webapps/static/css/style.css > ./webapps/static/css/boilerplate_media.css

echo "Removing the parts we dont want..."
rm -rf .git
rm README.rst
rm ./webapps/static/css/style.css

echo "Creating symlinks..."
cd webapps/static
ln -s $HOME/Envs/$virtualenvname/lib/python2.7/site-packages/django/contrib/admin/media
ln -s $HOME/Envs/$virtualenvname/src/django-cms/cms/media/cms
ln -s $HOME/Envs/$virtualenvname/src/filer/filer/media/filer
ln -s $HOME/Envs/$virtualenvname/src/multilingual/multilingual/media/multilingual
cd ../..

echo "Creating local_settings.py ..."
cd webapps/django/project/
cp local_settings.py.sample local_settings.py
echo "What is your database username: "
read dbname
echo "Enter new password for that database: "
read dbpassword
sed -i s/dbname/$dbname/g local_settings.py
sed -i s/dbuser/$dbname/g local_settings.py
sed -i s/abc123/$dbpassword/g local_settings.py
cd ../../..
sed -i s@projectroot@$(pwd)/@g webapps/django/project/local_settings.py

echo "Initing the new git project..."
git init
git add .
git commit -m "Initial Commit"

echo "Woohoo! All done. Now run syncdb, migrate and runserver!"

echo "Enter mysql root password: "
stty -echo
read rootpassword
stty echo

mysql --user=root --password=$rootpassword -e "DELETE FROM user WHERE User = '$dbname';" mysql
mysql --user=root --password=$rootpassword -e "DROP DATABASE IF EXISTS $dbname;" mysql
mysqladmin --user=root --password=$rootpassword --character-set=utf8 --default-character-set=utf8 create $dname
mysql --user=root --password=$rootpassword -e "CREATE USER $dbname IDENTIFIED BY '$dbpassword';" mysql
mysql ---user=root --password=$rootpassword -e "CREATE DATABASE $dbname CHARACTER SET utf8 COLLATE utf8_general_ci;"
mysql ---user=root --password=$rootpassword -e "GRANT ALL ON $dbname.* TO $dbname;"
mysqladmin --user=root --password=$rootpassword reload