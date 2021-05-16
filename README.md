# Minimal GNU/Linux
Minimal GNU/Linux distribution for x86-64 from scratch.

This repository shows you how to build your own GNU/linux system. It is comparable to [linux from scratch (LFS)](), but the main difference is that this build process follows the linux boot process. Along the way after each functionality is added the system is booted to test it. In this way you can see the results of your hard work earlier in the process. Something that I was missing from LFS.

## Features
* Bash shell
* C runtime and build environment

## Packages
### Core
* GNU GRUB bootloader
* Linux kernel
* Systemd - System and service manager
* GNU Core utilities (coreutils)
* GNU C Library (glibc)

### Build tools
* GNU Binutils (binutils)
* GNU Compiler Collection (gcc)
* GNU Make (make)
* (GNU Autotools (Automake, Autoconf, M4, Libtool))

### Command-line tools
* GNU Find Utilities (findutils)
* GNU Grep
* GNU Tar

## Disk structure
Sector size = 512 bytes
```
SIZE    USE
1 MB    GUID Parition Table (GPT) + reserved
100 MB  EFI System Partition (ESP)
2+ GB   EXT4 file system (Linux installation)
2 GB    Linux Swap Partition
1 MB    Backup GUID Parition Table + empty space
```

## File system
### EFI System Partition - FAT32 file system
* EFI
  * BOOT
    * BOOTX64.EFI
    * GRUB

### Linux Partition - EXT4 file system
* boot
  * grub
    * ...
    * grub.cfg
  * kernel-5.11.17 - bzImage linux kernel

## Development
### Preliminary knowledge
You should be familiar with the GNU/Linux system and especially compilation process of C applications. You can find some of this information on the [GNU/Linux basics](GNU_Linux_basics.md) page.

### Tartget architecture
* x86-64 with UEFI firmware.

### Prerequisites
* Running x86-64 linux host system.

## Steps
1. [Create and partition disk drive](1_prepare_disk_drive.md) or [image](1_create_disk_image.md).
2. [Install GRUB bootloader](2_install_grub_loader.md).
3. [Install Linux kernel](3_install_linux_kernel.md).
4. [Build static system](4_build_static_system.md).
5. [Start system](5_start_system.md).
