# GNU/Linux basics
The GNU/Linux system offers a list of functionalities and underlying each functionalty is a set of files, directories and processes (applications or services).

This page describes the most important functionalities of the GNU/Linux system by explaining the files and processes involved and by naming related commands.

The following functionalities are described on this page:
* File system
* Shell
* Multi process
* Environment variables
* Users
* Mounting disks

# File system
The file system, like EXT4, can store the following objects:
* Files
* Directories
* Symbolink links

# Shell (bash)
...

# Multi process
...

# Environment variables
...

# Users
## Files
The following files are involed in user management:
```
-rw-r--r-- 1 root root   2894 Aug  2  2020 /etc/passwd
-rw-r--r-- 1 root root   1140 Aug 20  2020 /etc/group
-rw-r----- 1 root shadow 1460 Aug  2  2020 /etc/shadow
-rw-r----- 1 root shadow 954  Aug 20  2020 /etc/gshadow
```

The users are stored in the file `/etc/passwd` as tuples according to the following format:
```
username : password : user id : group id : full name : home directory : login shell
```
Example `/etc/passwd`:
```
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
martijn:x:1000:1000:Martijn,,,:/home/martijn:/bin/bash
...
```
The groups are stored in the file `/etc/group` as tuples according to the following format:
```
group_name : password : group id : user list
```
Example `/etc/group`:
```
root:x:0:
daemon:x:1:
bin:x:2:
sys:x:3:
adm:x:4:syslog,martijn
tty:x:5:syslog
martijn:x:1000:
...
```
The passwords are stored encrypted and if they have a value of 'x', then they're actually stored in `/etc/shadow` for the users and `/etc/gshadow` for the groups.

Example `/etc/shadow`:
```
root:!:17717:0:99999:7:::
daemon:*:17708:0:99999:7:::
bin:*:17708:0:99999:7:::
sys:*:17708:0:99999:7:::
martijn:abcdef:17717:0:99999:7:::
...
```

## File access
Every file, directory and symbolic link on the file system has an _owner_ and a _group_. These can be altered by the `chown` command.

The access rights on the file for the _user_, _group_ and _others_ can be set by the `chmod` command.

## Commands
Users can be added, deleted and modified with the commands `useradd`, `userdel` and `usermod`. The user password should be set with `passwd`.

Groups can be added, deleted and modifief with the commands `groupadd`, `groupdel` and `groupmod`.

# Multi process

# Mounting disks
`/etc/fstab`