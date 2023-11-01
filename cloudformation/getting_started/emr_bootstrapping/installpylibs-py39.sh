#!/bin/bash
set -e

sudo yum install -y gcc libffi-devel libtiff-devel libjpeg-devel libzip-devel freetype-devel lcms2-devel libwebp-devel tcl-devel tk-devel
 
sudo wget https://www.python.org/ftp/python/3.9.0/Python-3.9.0.tgz  
sudo tar -zxvf Python-3.9.0.tgz
cd Python-3.9.0
sudo ./configure --enable-optimizations --prefix=/usr/
 
sudo make altinstall
 
python3.9 -m pip install --upgrade awscli --user 

sudo ln -sf /usr/bin/python3.9 /usr/bin/python3
 
# Remove outdated virtualenv (This likely won't be needed on future EMR Versions)
sudo yum -y remove python-virtualenv
 
sudo /usr/bin/python3 --version
 
sudo /usr/bin/python3 -m pip install -U virtualenv cython setuptools
 

sudo /usr/bin/python3 -m pip install -U cython
sudo /usr/bin/python3 -m pip install -U numpy
sudo /usr/bin/python3 -m pip install -U matplotlib
sudo /usr/bin/python3 -m pip install -U requests
sudo /usr/bin/python3 -m pip install -U boto3
sudo /usr/bin/python3 -m pip install -U pandas
sudo /usr/bin/python3 -m pip install -U PyPDF2
sudo /usr/bin/python3 -m pip install -U pikepdf
sudo /usr/bin/python3 -m pip install -U pycryptodome
sudo /usr/bin/python3 -m pip install -U langchain==0.0.310
sudo /usr/bin/python3 -m pip install -U opensearch-py
sudo /usr/bin/python3 -m pip install -U plotly
sudo /usr/bin/python3 -m pip install -U jupyter-dash 

sudo /usr/bin/python3 -c "import plotly.io as pio; pio.renderers.default = 'notebook_connected';"

echo "Done"