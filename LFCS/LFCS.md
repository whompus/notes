# Linux Foundation Certified Sysadmin Notes

https://refspecs.linuxfoundation.org/FHS_3.0/fhs/index.html

## Useful commands with `find`

Find basic syntax:

```bash
find /dir/to/search -name "name_of_file"
```

to ignore case:

```bash
find /dir/to/search -iname "name_of_file"
```

find everything but thing to search for:

```bash
find /dir/to/search -not -name "name_of_file"
```

find types of files:

```bash
find /dir/to/search -type f -name "*.log"
```

find when something was created (timestamp):

```bash
find /dir/to/search -type f -mtime 1
```

find w/ exec:

```bash
find / -name "test.txt" -exec chmod 700 {} \;

# This will find any test.txt files in the root dir, then uses exec directive to execute chmod command, then ends with a placeholder, {} \;, which will get replaced in the system with the internal file handles, then execute the commands.  

# http://www.hypexr.org/linux_find_help.php
```

___

## File System Features and Options

### Block Device

* Magnetic HD, SSD, or USB Flash Storage

### File System

* The organization system used to store and retrieve data from the block device
* Can affect performance of the system, efficiency of the media, and compatibility with other systems

### FS types

* Ext: Extended file system, introduced in 1992

* Ext2: was the first file system to support extended file attributes (x-attrs) and 2TB+ drives  

* Ext3: introduced journaling

* Ext4: designed to be backward compatible and introduced some additional features - been around since 2008, widely tested, probably better off using this FS, it's the standard

* BtrFS: B-Tree File System; Drive pooling, snapshots, compression, online defragmentation

* ReiserFS:  introduced in 2001

* ZFS: designed by Sun Microsystems (now oracle), google for more info

* XFS: Ported to linux in 2001, similar to Ext4, can be enlarged (bot not shrunk) on the fly
  * Good with large files (like backup servers!)
  * Poor with many small files (like web servers!)

* ... And others like JFS, etc. look up later if you want

* __Swap__: not used as actual file system -- Virtual Memory!
  * Scratch space for stuff that won't fit in RAM
  * Hibernating
  * Analogous to Windows Paging File

* FAT (FAT16, FAT32, exFAT)
  * Microsoft's "File Allocation Table" file system
  * NOT JOURNALED!
  * Great for USB drives that you'll be using on Windows or Apple hardware
  * exFAT ideal option as it supports files over 4gb and partitions over 8tb in size, unlike FAT32

___

## Compare/Manipulate File Content and Use Input-Output Redirection

