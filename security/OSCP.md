- [Introduction to PEN-100](#introduction-to-pen-100)
  - [CIA Triad](#cia-triad)
  - [Other Design Principles](#other-design-principles)
- [Linux Basics](#linux-basics)
  - [User Account Details](#user-account-details)
  - [Permissions](#permissions)
  - [Processes](#processes)
- [Networking Fundamentals](#networking-fundamentals)
  - [Wireshark](#wireshark)
  - [Tcpdump](#tcpdump)
  - [Address Resolution Protocol (ARP)](#address-resolution-protocol-arp)
  - [DHCP](#dhcp)
  - [Routing Tables](#routing-tables)
  - [NAT and PAT](#nat-and-pat)

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

### Processes



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
