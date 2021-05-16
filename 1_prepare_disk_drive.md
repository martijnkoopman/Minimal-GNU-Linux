**1. Determine device path and size**
```
/dev/sda

60062500 sectors * 512 = 30752000000 bytes

START       END         SECTORS     SIZE        USE
0           2047        2048        1MB         GPT + reserved
2048        206847      204800      100M        EFI System
206848      54732800    54525952    26GB        EXT4
54732801    58927105    4194304     2GB         Linux Swap
58927106    60062499    2048        554.39MB    Empty space + GPT backup table
```


**2. Unmount any mounted partitions of that disk.**
```
sudo unmount /dev/sda1
```

**3. Clear disk**
```
sudo dd if=/dev/zero of=/dev/sda
```

**4. Create GUID Partition Table (GPT)**

```
sudo parted /dev/sda mklabel gpt
```

**5. Create 100MB EFI System Partition (ESP)**

Skip first 1MB for GPT. 204800 sectors * 512 bytes = 100 MB
```
sudo parted /dev/sda -a minimal mkpart ESP fat32 2048s 195347s
```
```
sudo parted /dev/sda set 1 esp on
```

**6. Create FAT32 file system**
```
sudo mkfs.vfat /dev/sda1
```

```
mkdir ESP
sudo mount /dev/sda1 ESP
sudo cd ESP
sudo mkdir EFI
sudo cd EFI
sudo mkdir BOOT
sudo cd BOOT
COPY BZIMAGE TO BOOTX64.EFI
```

**7. Create EXT4 partition**
```
sudo parted /dev/sda -a minimal mkpart LINUX ext4 206848s 54732800s
```

**8. Create EXT4 file system**
```
# Create EXT4 file system in EXT4 partition
sudo mkfs.ext4 /dev/sda2
```
Note the file system UUID:
```
Filesystem UUID: e49c6a78-c84f-4df0-af52-8b278c45952d
```

**7. Create 2GB Swap partition**
```

```

* 2 GB = 1024 MB = 1024 * 1024 kB = 1024 * 1024 * 1024 bytes = 1073741824 bytes
* 1073741824 bytes / 512 = 2097152 sectors