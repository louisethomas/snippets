#!/bin/sh

DRIVE_PATH='G:/'
HOST_IP=`tail --lines=1 /etc/resolv.conf | awk '{print $2}'`
IDENTITY_FILE='~/.ssh/id_rsa'
USERNAME='louis'

echo $HOST_IP 

sshfs -o "IdentityFile=$IDENTITY_FILE" $USERNAME@$HOST_IP:"$DRIVE_PATH" -o allow_other,gid=`id --group`,idmap=user,uid=`id --user` /mnt/gdrive
