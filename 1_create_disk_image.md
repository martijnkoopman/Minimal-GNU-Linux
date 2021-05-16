# Create and partition disk image
1. Create disk image
2. Partition disk image
3. Create file systems in partitions

## 1. Create disk image
We'll create a disk image with a GUID Partition Table (GPT). The first parition will be a 100 MB EFI System Partition (ESP) and the second partition will be a 900 MB EXT4 file system. The GNU/Linux system will be installed on the latter.

**1.1. Create 1000 MB disk image.**

512 bytes * 1953125 = 1000.000.000 bytes = 1 GB
```
dd if=/dev/zero of=disk.img bs=512 count=1953125
```

## 2. Partition disk image
**2.1. Create GUID Parition Table (GPT).**
```
parted disk.img mklabel gpt
```
Ignore any warnings about not being super user. Super user is not required to manipulate the disk image.

**2.2. Create 100 MB EFI System Partition (ESP).**

The GUID Partition Table (GPT) is located at the beginning of the memory and occupies (at most) 34 sectors of the disk image. We therefore have to use an offset of 34 for our first partition.

* Size = 512 bytes * 195313 = 100.000.256 bytes
* End = 195313 + 34 = 195347

Create a FAT32 partition with the name 'ESP' from sector 34 to 195347 and use minimal alignment:
```
parted disk.img -a minimal mkpart ESP fat32 34s 195347s
```

Set flag on the newly created FAT32 partition to mark it as bootable EFI System Partition:
```
parted disk.img set 1 esp on
```

**2.3. Create 900 MB EXT partition.**

A backup of the GUID Partition Table is located at the end of the memory. We therefore have to use an offset of 34 at the end.

* End = 1953125 - 34 = 1953091 sectors
```
parted disk.img -a minimal mkpart LINUX ext4 195348s 1953091s
```

**2.4. Verify disk image**

Unit B for bytes, S for sectors (512 bytes)
```
parted disk.img unit B print
```
```
Model:  (file)
Disk Minimal-GNU-Linux/disk.img: 1953125s
Sector size (logical/physical): 512B/512B
Partition Table: gpt
Disk Flags: 

Number  Start       End         Size        File system  Name   Flags
 1      17408B      100018175B  100000768B               ESP    boot, esp
 2      100018176B  999983103B  899964928B  ext4         LINUX
 ```

## 3. Create file systems in partitions

**3.1. Create FAT32 file system in EFI System Partition (ESP)**
* Offset = 17408 bytes
* Size = 100000768 bytes / 1024 = 97657 kB
```
mkfs.vfat -E offset=17408 disk.img disk.img 97657k
```

**3.2. Create EXT4 file system in other partition**

* Offset = 100018176 bytes
* Size = 899964928 bytes / 1024 = 878872 kB
```
mkfs.ext4 -E offset=100018176 disk.img 878872k
```

 **6. Mount partitions**
 
```
sudo mount -t ext4 -o loop,offset=100018176,sizelimit=899964928 disk.img ESP
```

 Create loop device:
 ```
 sudo losetup -f disk.img
 ```

 Check name of created loop device:
 ```
losetup -j disk.img
 ```
 ```
 /dev/loop11: []: (/Minimal-GNU-Linux/disk.img)
 ```

Remove loop device
```
sudo losetup -d /dev/loop11
```
