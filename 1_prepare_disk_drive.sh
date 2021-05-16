# Create GUID Partition Table
sudo parted /dev/sda mklabel gpt

# Create FAT32 partition with name 'ESP'
sudo parted /dev/sda -a minimal mkpart ESP fat32 2048s 195347s

# Mark FAT32 partion as EFI System Partition (ESP)
sudo parted /dev/sda set 1 esp on

# Create FAT32 file system in FAT32 partition
sudo mkfs.vfat /dev/sda1

# Create EXT4 partition with name LINUX
sudo parted /dev/sda -a minimal mkpart LINUX ext4 206848s 54732800s

# Create EXT4 file system in EXT4 partition
sudo mkfs.ext4 /dev/sda2

# Create Linux Swap partition
sudo parted /dev/sda -a minimal mkpart SWAP linux-swap 54732801s 58927105s
