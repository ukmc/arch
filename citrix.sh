#!/bin/bash
#wget https://downloads.citrix.com/14822/linuxx64-13.10.0.20.tar.gz?__gda__=1597217785_f1f97c02b3dee16d89d6161db9477edd
#tar -zxvf linuxx64-13.10.0.20.tar.gz*

ln -s /usr/lib64/libidn.so.12 /usr/lib64/libidn.so.11
pacman -S libgtk-x11-2.0.so
rm -rf /opt/Citrix/ICAClient/keystore/cacerts
ln -s /etc/ssl/certs /opt/Citrix/ICAClient/keystore/cacerts