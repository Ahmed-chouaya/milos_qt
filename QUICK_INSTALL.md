# Quick Installation - Updated

## 🚀 Simple Installation Steps

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

## 🔧 What the Script Does

1. **Clones configuration** to `$HOME/nixos-config`
2. **Generates hardware config** for your specific laptop
3. **Attempts to build with milos-qt** if available
4. **Falls back to NixOS + Niri** if milos-qt repo not accessible
5. **Installs system** with `nixos-rebuild switch`

## 📝 If Script Fails with Flake Error

The script will still install NixOS + Niri. To add milos-qt later:

```bash
# After reboot, in your new system:
git clone https://github.com/Ahmed-chouaya/milos_qt.git
cd milos-qt
nix build

# Then copy the built package to your system
```

## ✅ After Reboot You'll Have:

- **Niri window manager** (starts automatically)
- **Timezone**: Africa/Tunis
- **Keyboard**: AZERTY
- **Auto-login**: User "ahmed"
- **Minimal packages**: git, firefox, alacritty, etc.

## 🔧 Add milos-qt Later (if needed)

```bash
cd $HOME/nixos-config
# Edit flake.nix to reference local milos-qt
# Then rebuild:
sudo nixos-rebuild switch --flake .#niri-host
```

**🎯 This approach ensures your system installs even if milos-qt repository has issues!**