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
