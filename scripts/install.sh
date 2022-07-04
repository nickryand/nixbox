#!/bin/sh -e

packer_http=$(cat .packer_http)

# Partition disk
cat <<FDISK | fdisk /dev/sda
n




a
w

FDISK

# Create filesystem
mkfs.ext4 -j -L nixos /dev/sda1

# Mount filesystem
mount LABEL=nixos /mnt

# Setup system
nixos-generate-config --root /mnt

mv /tmp/*.nix /mnt/etc/nixos/

### Install ###
nixos-install

### Cleanup ###
nixos-enter < /tmp/postinstall.sh
