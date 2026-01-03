# Updated Installation Instructions

## ⚠️ IMPORTANT NOTE
GitHub may have caching issues with raw file content. If the URL below doesn't work, wait 5-10 minutes for GitHub to update, or manually fix the REPO_URL line.

## 🚀 One-Command Installation

### 1. Boot from NixOS Minimal ISO
Download from: https://nixos.org/download.html

### 2. Connect to WiFi (if needed)
```bash
sudo nmtui
```

### 3. Partition and Format Disk
⚠️ **WARNING: This erases your disk! Replace `/dev/sda` with your actual disk.**

```bash
sudo sgdisk -Z /dev/sda
sudo sgdisk -n 1:0:+512M -t 1:ef00 -c 1:"EFI" /dev/sda
sudo sgdisk -n 2:0:+4G -t 2:8200 -c 2:"swap" /dev/sda
sudo sgdisk -n 3:0:0 -t 3:8300 -c 3:"nixos" /dev/sda

sudo mkfs.fat -F 32 /dev/sda1
sudo mkswap /dev/sda2
sudo mkfs.btrfs /dev/sda3

sudo mount /dev/sda3 /mnt
sudo btrfs subvolume create /mnt/@
sudo btrfs subvolume create /mnt/@home
sudo umount /mnt

sudo mount -o subvol=@ /dev/sda3 /mnt
sudo mkdir -p /mnt/home
sudo mount -o subvol=@home /dev/sda3 /mnt/home
sudo mkdir -p /mnt/boot
sudo mount /dev/sda1 /mnt/boot
sudo swapon /dev/sda2
```

### 4. Download and Run Install Script
```bash
curl -O https://raw.githubusercontent.com/Ahmed-chouaya/milos_qt/main/nixos-config/install.sh
chmod +x install.sh
./install.sh
```

### 5. Review Hardware Configuration
After first run, the script will exit and ask you to review:
```bash
cd $HOME/nixos-config
nano hosts/hardware-configuration.nix
```

### 6. Complete Installation
```bash
./install.sh
sudo reboot
```

## 🔧 Manual Fix (if needed)

If the downloaded install.sh has the wrong REPO_URL, edit line 7:
```bash
nano install.sh
# Change line 7 to:
REPO_URL="https://github.com/Ahmed-chouaya/milos_qt.git"
```

## ✅ What You Get After Reboot

- **Niri window manager** (starts automatically)
- **milos-qt desktop** (neobrutalist UI)
- **Timezone**: Africa/Tunis
- **Keyboard**: AZERTY
- **Auto-login**: User "ahmed"

## 📁 Your Configuration

All files are at: `$HOME/nixos-config/`

### Update system later:
```bash
cd $HOME/nixos-config
sudo nixos-rebuild switch --flake .#niri-host
```