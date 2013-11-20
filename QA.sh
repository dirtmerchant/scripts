#!/bin/sh
#
#https://desk.gotoassist.com/incidents/14739
#
#Script location
#colobdintegration
#/root/QA.sh
#
#The following entries exist in /etc/fstab
#//hqfiler.ad.bdel.com/department/ /media/department cifs credentials=/root/.smbcredentials,iocharset=utf8,sec=ntlm 0 0
#//colobddfs01.ad.bdel.com/international/ /media/international cifs credentials=/root/.smbcredentials,iocharset=utf8,sec=ntlm 0 0
#
#Crontab entry
#18 * * * sh /root/QA.sh 

#Mount the shares
mount.cifs //hqfiler.ad.bdel.com/department /media/department -o credentials=/root/.smbcredentials
mount.cifs //colobddfs01.ad.bdel.com/international /media/international -o credentials=/root/.smbcredentials

#Cleans up international drive
rm -v /media/international/GMP/QASpecs/*

#Copies all PDF documents containing the string "QA_spec" in the title to the international share. Skips files containing the strings "archive" or "ss"
find /media/department/GMP/PRODUCT/Product\ Vault\ Files/ -not -ipath “*archive*” -iname ‘*QA_Spec.pdf’ -and -not -iname ‘ss*’ -type f -exec cp -v “{}” /media/international/GMP/QASpecs/ \;

#Ten second pause
sleep 10

#Unmount the shares
umount -l /media/department
umount -l /media/international