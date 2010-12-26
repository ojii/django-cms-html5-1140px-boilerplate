#!/usr/bin/env bash
cd webapps/static
echo "What is the name of your virtualenv: "
read virtualenvname
ln -s $HOME/Envs/$virtualenvname/lib/python2.7/site-packages/django/contrib/admin/media
ln -s $HOME/Envs/$virtualenvname/src/django-cms/cms/media/cms
ln -s $HOME/Envs/$virtualenvname/src/filer/filer/media/filer
ln -s $HOME/Envs/$virtualenvname/src/multilingual/multilingual/media/multilingual

