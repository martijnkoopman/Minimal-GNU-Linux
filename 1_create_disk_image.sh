dd if=/dev/zero of=disk.img bs=512 count=1953125
parted disk.img -s mklabel gpt
parted disk.img -s -a minimal mkpart ESP fat32 34s 195347s
parted disk.img -s set 1 esp on
parted disk.img -s -a minimal mkpart LINUX ext4 195348s 1953091s
parted disk.img -s unit B print