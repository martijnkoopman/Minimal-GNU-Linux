# 2. Install GRUB bootlader

## Files
### ESP partition
* EFI/
  * BOOT/
    * BOOTX64.EFI - EFI application start by UEFI
    * grubx64.efi
    * grub.cfg - Configuration file with reference to `[EXT4]/boot/grub/grub.cfg`

### EXT4 partition
* boot/
    * fonts/
      * unicode.pf2 - [PFF2 font file](https://www.gnu.org/software/grub/manual/grub-dev/html_node/PFF2-Font-File-Format.html)
    * x86_64-efi/
      * ...
    * grub.cgf - TODO

## Steps
**1. Install GRUB**
```
sudo mkdir LINUX/boot
sudo grub-install --efi-directory=/home/martijn/Development/Projects/Minimal-GNU-Linux/ESP/ --boot-directory=/home/martijn/Development/Projects/Minimal-GNU-Linux/LINUX/boot --removable
```

**2. Configure GRUB**

TODO

## Boot to GRUB
```
sudo qemu-system-x86_64 -m 512M -cpu qemu64 -bios /usr/share/ovmf/OVMF.fd /dev/sda
```