#!/bin/bash
cd /root/project/surgery-brain
mkvirtualenv surgery-brain
pip install -r requirements_linux.txt
uwsgi --ini uwsgi_dev.ini