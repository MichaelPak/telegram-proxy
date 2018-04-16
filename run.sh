#!/bin/sh
adduser -D $USER
echo "$USER:$PASSWD" | chpasswd
sockd
