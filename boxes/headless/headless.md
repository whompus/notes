# nmap scan

```
$ nmapall headless.htb      
Host discovery disabled (-Pn). All addresses will be marked 'up' and scan times may be slower.
Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-03-29 10:41 MDT
NSE: Loaded 156 scripts for scanning.
NSE: Script Pre-scanning.
Initiating NSE at 10:41
Completed NSE at 10:41, 0.00s elapsed
Initiating NSE at 10:41
Completed NSE at 10:41, 0.00s elapsed
Initiating NSE at 10:41
Completed NSE at 10:41, 0.00s elapsed
Initiating SYN Stealth Scan at 10:41
Scanning headless.htb (10.129.245.0) [65535 ports]
Discovered open port 22/tcp on 10.129.245.0
Discovered open port 5000/tcp on 10.129.245.0
Completed SYN Stealth Scan at 10:41, 16.42s elapsed (65535 total ports)
Initiating Service scan at 10:41
Scanning 2 services on headless.htb (10.129.245.0)
Completed Service scan at 10:43, 93.24s elapsed (2 services on 1 host)
NSE: Script scanning 10.129.245.0.
Initiating NSE at 10:43
Completed NSE at 10:43, 1.51s elapsed
Initiating NSE at 10:43
Completed NSE at 10:43, 1.06s elapsed
Initiating NSE at 10:43
Completed NSE at 10:43, 0.00s elapsed
Nmap scan report for headless.htb (10.129.245.0)
Host is up (0.049s latency).
Not shown: 65533 closed tcp ports (reset)
PORT     STATE SERVICE VERSION
22/tcp   open  ssh     OpenSSH 9.2p1 Debian 2+deb12u2 (protocol 2.0)
| ssh-hostkey: 
|   256 90:02:94:28:3d:ab:22:74:df:0e:a3:b2:0f:2b:c6:17 (ECDSA)
|_  256 2e:b9:08:24:02:1b:60:94:60:b3:84:a9:9e:1a:60:ca (ED25519)
5000/tcp open  upnp?
| fingerprint-strings: 
|   GetRequest: 
|     HTTP/1.1 200 OK
|     Server: Werkzeug/2.2.2 Python/3.11.2
|     Date: Fri, 29 Mar 2024 16:41:44 GMT
|     Content-Type: text/html; charset=utf-8
|     Content-Length: 2799
|     Set-Cookie: is_admin=InVzZXIi.uAlmXlTvm8vyihjNaPDWnvB_Zfs; Path=/
|     Connection: close
|     <!DOCTYPE html>
|     <html lang="en">
|     <head>
|     <meta charset="UTF-8">
|     <meta name="viewport" content="width=device-width, initial-scale=1.0">
|     <title>Under Construction</title>
|     <style>
|     body {
|     font-family: 'Arial', sans-serif;
|     background-color: #f7f7f7;
|     margin: 0;
|     padding: 0;
|     display: flex;
|     justify-content: center;
|     align-items: center;
|     height: 100vh;
|     .container {
|     text-align: center;
|     background-color: #fff;
|     border-radius: 10px;
|     box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.2);
|   RTSPRequest: 
|     <!DOCTYPE HTML>
|     <html lang="en">
|     <head>
|     <meta charset="utf-8">
|     <title>Error response</title>
|     </head>
|     <body>
|     <h1>Error response</h1>
|     <p>Error code: 400</p>
|     <p>Message: Bad request version ('RTSP/1.0').</p>
|     <p>Error code explanation: 400 - Bad request syntax or unsupported method.</p>
|     </body>
|_    </html>
1 service unrecognized despite returning data. If you know the service/version, please submit the following fingerprint at https://nmap.org/cgi-bin/submit.cgi?new-service :
SF-Port5000-TCP:V=7.94SVN%I=7%D=3/29%Time=6606EF48%P=aarch64-unknown-linux
SF:-gnu%r(GetRequest,BE1,"HTTP/1\.1\x20200\x20OK\r\nServer:\x20Werkzeug/2\
SF:.2\.2\x20Python/3\.11\.2\r\nDate:\x20Fri,\x2029\x20Mar\x202024\x2016:41
SF::44\x20GMT\r\nContent-Type:\x20text/html;\x20charset=utf-8\r\nContent-L
SF:ength:\x202799\r\nSet-Cookie:\x20is_admin=InVzZXIi\.uAlmXlTvm8vyihjNaPD
SF:WnvB_Zfs;\x20Path=/\r\nConnection:\x20close\r\n\r\n<!DOCTYPE\x20html>\n
SF:<html\x20lang=\"en\">\n<head>\n\x20\x20\x20\x20<meta\x20charset=\"UTF-8
SF:\">\n\x20\x20\x20\x20<meta\x20name=\"viewport\"\x20content=\"width=devi
SF:ce-width,\x20initial-scale=1\.0\">\n\x20\x20\x20\x20<title>Under\x20Con
SF:struction</title>\n\x20\x20\x20\x20<style>\n\x20\x20\x20\x20\x20\x20\x2
SF:0\x20body\x20{\n\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20font-fa
SF:mily:\x20'Arial',\x20sans-serif;\n\x20\x20\x20\x20\x20\x20\x20\x20\x20\
SF:x20\x20\x20background-color:\x20#f7f7f7;\n\x20\x20\x20\x20\x20\x20\x20\
SF:x20\x20\x20\x20\x20margin:\x200;\n\x20\x20\x20\x20\x20\x20\x20\x20\x20\
SF:x20\x20\x20padding:\x200;\n\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20
SF:\x20display:\x20flex;\n\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20
SF:justify-content:\x20center;\n\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x
SF:20\x20align-items:\x20center;\n\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20
SF:\x20\x20height:\x20100vh;\n\x20\x20\x20\x20\x20\x20\x20\x20}\n\n\x20\x2
SF:0\x20\x20\x20\x20\x20\x20\.container\x20{\n\x20\x20\x20\x20\x20\x20\x20
SF:\x20\x20\x20\x20\x20text-align:\x20center;\n\x20\x20\x20\x20\x20\x20\x2
SF:0\x20\x20\x20\x20\x20background-color:\x20#fff;\n\x20\x20\x20\x20\x20\x
SF:20\x20\x20\x20\x20\x20\x20border-radius:\x2010px;\n\x20\x20\x20\x20\x20
SF:\x20\x20\x20\x20\x20\x20\x20box-shadow:\x200px\x200px\x2020px\x20rgba\(
SF:0,\x200,\x200,\x200\.2\);\n\x20\x20\x20\x20\x20")%r(RTSPRequest,16C,"<!
SF:DOCTYPE\x20HTML>\n<html\x20lang=\"en\">\n\x20\x20\x20\x20<head>\n\x20\x
SF:20\x20\x20\x20\x20\x20\x20<meta\x20charset=\"utf-8\">\n\x20\x20\x20\x20
SF:\x20\x20\x20\x20<title>Error\x20response</title>\n\x20\x20\x20\x20</hea
SF:d>\n\x20\x20\x20\x20<body>\n\x20\x20\x20\x20\x20\x20\x20\x20<h1>Error\x
SF:20response</h1>\n\x20\x20\x20\x20\x20\x20\x20\x20<p>Error\x20code:\x204
SF:00</p>\n\x20\x20\x20\x20\x20\x20\x20\x20<p>Message:\x20Bad\x20request\x
SF:20version\x20\('RTSP/1\.0'\)\.</p>\n\x20\x20\x20\x20\x20\x20\x20\x20<p>
SF:Error\x20code\x20explanation:\x20400\x20-\x20Bad\x20request\x20syntax\x
SF:20or\x20unsupported\x20method\.</p>\n\x20\x20\x20\x20</body>\n</html>\n
SF:");
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

NSE: Script Post-scanning.
Initiating NSE at 10:43
Completed NSE at 10:43, 0.00s elapsed
Initiating NSE at 10:43
Completed NSE at 10:43, 0.00s elapsed
Initiating NSE at 10:43
Completed NSE at 10:43, 0.00s elapsed
Read data files from: /usr/bin/../share/nmap
Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 112.52 seconds
           Raw packets sent: 65535 (2.884MB) | Rcvd: 65535 (2.621MB)
```

# dirsearch

```
$ dirsearch -u http://headless.htb:5000 -w /usr/share/wordlists/dirb/big.txt

  _|. _ _  _  _  _ _|_    v0.4.3                                                                                                                                                        
 (_||| _) (/_(_|| (_| )                                                                                                                                                                 
                                                                                                                                                                                        
Extensions: php, aspx, jsp, html, js | HTTP method: GET | Threads: 25 | Wordlist size: 20469

Output File: /home/parallels/projects/machines/reports/http_headless.htb_5000/_24-03-29_11-19-37.txt

Target: http://headless.htb:5000/

[11:19:37] Starting:                                                                                                                                                                    
[11:20:05] 401 -  317B  - /dashboard                                        
[11:21:02] 200 -    2KB - /support                                          
                                                                             
Task Completed 
```

# use header to deliver thing

$ python3 -m http.server 8000
Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...
10.10.14.133 - - [29/Mar/2024 11:41:34] "GET / HTTP/1.1" 200 -
10.10.14.133 - - [29/Mar/2024 11:41:34] code 404, message File not found
10.10.14.133 - - [29/Mar/2024 11:41:34] "GET /favicon.ico HTTP/1.1" 404 -
10.10.14.133 - - [29/Mar/2024 11:42:32] "GET / HTTP/1.1" 200 -
10.129.245.0 - - [29/Mar/2024 11:43:18] "GET / HTTP/1.1" 200 -
10.129.245.0 - - [29/Mar/2024 11:44:20] code 404, message File not found
10.129.245.0 - - [29/Mar/2024 11:44:20] "GET /is_admin=ImFkbWluIg.dmzDkZNEm6CK0oyL1fbM-SnXpH0 HTTP/1.1" 404 -
10.129.245.0 - - [29/Mar/2024 11:44:22] code 404, message File not found
10.129.245.0 - - [29/Mar/2024 11:44:22] "GET /is_admin=ImFkbWluIg.dmzDkZNEm6CK0oyL1fbM-SnXpH0 HTTP/1.1" 404 -
10.129.245.0 - - [29/Mar/2024 11:44:24] code 404, message File not found
10.129.245.0 - - [29/Mar/2024 11:44:24] "GET /is_admin=ImFkbWluIg.dmzDkZNEm6CK0oyL1fbM-SnXpH0 HTTP/1.1" 404 -
10.10.14.133 - - [29/Mar/2024 11:44:37] "GET / HTTP/1.1" 200 -

Use that admin cookie to get to /dashboard, then on the report tab, use burp to add `;<rev shell>` to date to get user

added rev shell to `init.db` and run syscheck as sudo and get root flag
