#!/usr/bin/env bash
echo "Enter mysql root password: "
stty -echo
read rootpassword
stty echo
echo "Enter new database name (username will be the same): "
read dbname
echo "Password will be abc123"
mysql -uroot -p$rootpassword -e "CREATE USER $dbname IDENTIFIED BY 'abc123';"
mysql -uroot -p$rootpassword -e "CREATE DATABASE $dbname CHARACTER SET utf8 COLLATE utf8_general_ci;"
mysql -uroot -p$rootpassword -e "GRANT ALL ON $dbname.* TO $dbname;"
