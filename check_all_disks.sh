#!/bin/bash

# Check if the user is a superuser
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as a superuser."
  exit 1
fi

# Get a list of all hard drives
disks=$(lsblk -d | awk '{print $1}' | tail -n +2)

# File system types that are generally safe for fsck
safe_filesystems=("ext2" "ext3" "ext4" "vfat")

# Iterate over each hard drive and run fsck
for disk in $disks; do
  echo "----------------------------------------------------"
  echo "Checking disk: /dev/$disk..."
  echo "----------------------------------------------------"

  # Find all partitions for the specific disk
  partitions=$(lsblk -o NAME,FSTYPE | grep "^$disk" | awk '$2!=""{print $1,$2}')

  # Run fsck on each partition
  for line in $partitions; do
    read -r part fstype <<< "$line"

    mountpoint=$(findmnt -no TARGET -S /dev/$part)

    # Unmount if it is mounted
    if [ ! -z "$mountpoint" ]; then
      echo "Unmounting $mountpoint..."
      umount /dev/$part
    fi

    # Check if the file system type is safe for fsck
    if [[ " ${safe_filesystems[@]} " =~ " ${fstype} " ]]; then
      echo "Checking partition: /dev/$part of type $fstype..."
      fsck -C0 /dev/$part
    else
      echo "Skipping partition: /dev/$part of type $fstype (not safe for fsck)"
    fi

    # Remount if it had been unmounted
    if [ ! -z "$mountpoint" ]; then
      echo "Remounting at $mountpoint..."
      mount /dev/$part $mountpoint
    fi

    echo "Done with /dev/$part."
  done

  echo "Done with /dev/$disk."
  echo "----------------------------------------------------"
done
