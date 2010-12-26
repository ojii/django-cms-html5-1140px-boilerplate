#!/usr/bin/env bash

mkvirtualenv -p python2.6 --no-site-packages $1
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
