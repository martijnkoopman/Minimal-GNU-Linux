# Minimal GNU/Linux
Minimal GNU/Linux distribution for x86-64 from scratch.

## Features
* Bash shell
* C runtime and build environment

## Packages
### Core
* GNU GRUB bootloader
* Linux kernel
* GNU Core utilities (coreutils)

### Build tools
* GNU Binutils (binutils)
* GNU Compiler Collection (gcc)
* GNU C Library (glibc)
* GNU Make (make)
* (GNU Autotools (Automake, Autoconf, M4, Libtool))

### Command-line tools
* GNU Find Utilities (findutils)
* GNU Grep
* GNU Tar

## Development requirements
* Running x86-64 linux environment

# Steps
## Download + Build Linux kernel
* Download latest stable Linux version
* Unpack
* Configure
```
$ wget ...
$ tar ...
$ cd ...
$ make x86_64_defconfig
$ sudo apt-get install libssl-dev libelf-dev
$ make
```

Bootloader is PE format (Use gcc) + startup.nsh bootx64.efi
KErnel is ELF format (use gcc mingw 64) - kernel.elf