#!/bin/bash

/usr/sbin/sshd -D
nginx -g 'daemon off;'
tail -f /dev/null
