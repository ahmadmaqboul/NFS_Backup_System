#!/bin/bash
help="

THIS SCRIPT FOR BACKUP USING NFS mounting point 

       please check this link to create the mount point in ubuntu
       (https://www.digitalocean.com/community/tutorials/how-to-set-up-an-nfs-mount-on-ubuntu-20-04)

       how you can use it ?
       sh Backup_NFS.sh [mount file in client] [local Backup location] [folder or file you want to backup]
       
       dont forget to give the absolute path 
       
       Author : Ahmad Maqboul
       Date : 20/6/2020

"

while getopts 'h,x' option; do
  case "$option" in
    h) echo "$help"
       exit
       ;;
    x) echo "some thing we want user to show"
       exit
       ;;
  esac
done

BackupFolder=$1 # this is the folder that we mount with the server  
Folder=$2 # this is the folder that we want to backup in server 
localBackup=$3 #this is the folder that we want to backup in local 
fileName=`date | awk '{print $2 $3 $4}'`

`tar -czvf $BackupFolder/$fileName.tar.gz $Folder `  # Compress and archive
error=echo $?

`tar -czvf $localBackup/$fileName.tar.gz $Folder `  # Compress and archive
error2=echo $?

if [ $error -eq 0 ]
then
`logger "the remote backup done to the server (nfs mount point) "`
else 
`logger "there is an error in remote backup to the server (nfs mount point-thisDir-) "`

fi

if [ $error2 -eq 0 ]
then
`logger "the local backup done to the server (Document) "`
else 
`logger "there is an error in local backup to the server (Document) "`

fi





