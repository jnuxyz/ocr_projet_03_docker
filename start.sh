#!/bin/bash

/usr/sbin/sshd -D
nginx -g 'daemon off;'
/usr/sbin/service nginx start
tail -f /dev/null
