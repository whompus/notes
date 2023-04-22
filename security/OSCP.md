- [Introduction to PEN-100](#introduction-to-pen-100)
  - [CIA Triad](#cia-triad)
  - [Other Design Principles](#other-design-principles)
- [Linux Basics](#linux-basics)
  - [User Account Details](#user-account-details)
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
  - [User Account Control (UAC)](#user-account-control-uac)
  - [`runas` and `cmd /c`](#runas-and-cmd-c)
  - [NTFS Permissions](#ntfs-permissions)

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
