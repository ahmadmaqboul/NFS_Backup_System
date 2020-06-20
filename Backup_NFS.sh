#!/bin/bash

BackupFolder="/home/client/Desktop/thisDir" # this is the folder that we mount with the server  
Folder="/home/client/Desktop/ahmad" # this is the folder that we want to backup in server 
localBackup="/home/client/Document" #this is the folder that we want to backup in local 
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





