#
#The following entries exist in /etc/fstab
#//hqfiler.ad.bdel.com/department/ /media/department cifs credentials=/root/.smbcredentials,iocharset=utf8,sec=ntlm 0 0
#//colobddfs01.ad.bdel.com/international/ /media/international cifs credentials=/root/.smbcredentials,iocharset=utf8,sec=ntlm 0 0
#
#
#Crontab entry
#18 * * * sh /root/QA.sh 
#
#Script location
#/root/QA.sh

#!/bin/sh
#https://desk.gotoassist.com/incidents/14739

mount.cifs //hqfiler.ad.bdel.com/department /media/department -o credentials=/root/.smbcredentials
mount.cifs //colobddfs01.ad.bdel.com/international /media/international -o credentials=/root/.smbcredentials

rm -v /media/international/GMP/QASpecs/*
find /media/department/GMP/PRODUCT/Product\ Vault\ Files/ -not -ipath “*archive*” -iname ‘*QA_Spec.pdf’ -and -not -iname ‘ss*’ -type f -exec cp -v “{}” /media/international/GMP/QASpecs/ \;

sleep 10

umount -l /media/department
umount -l /media/international