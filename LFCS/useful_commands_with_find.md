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
