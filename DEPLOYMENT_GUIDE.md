# Deployment Guide: NixOS Niri + milos-qt

## 🚀 One-Command Installation

### Step 1: Boot from NixOS Minimal ISO
Download and boot from: https://nixos.org/download.html

### Step 2: Connect to WiFi (if needed)
```bash
sudo nmtui
# Select "Activate a connection" and choose your WiFi
```

### Step 3: Partition and Format Disk
⚠️ **WARNING: This will erase your disk! Adjust `/dev/sda` to your actual disk.**

```bash
# Replace /dev/sda with your actual disk
sudo sgdisk -Z /dev/sda
sudo sgdisk -n 1:0:+512M -t 1:ef00 -c 1:"EFI" /dev/sda
sudo sgdisk -n 2:0:+4G -t 2:8200 -c 2:"swap" /dev/sda  
sudo sgdisk -n 3:0:0 -t 3:8300 -c 3:"nixos" /dev/sda

# Format partitions
sudo mkfs.fat -F 32 /dev/sda1
sudo mkswap /dev/sda2
sudo mkfs.btrfs /dev/sda3

# Create Btrfs subvolumes
sudo mount /dev/sda3 /mnt
sudo btrfs subvolume create /mnt/@
sudo btrfs subvolume create /mnt/@home
sudo umount /mnt

# Mount filesystems
sudo mount -o subvol=@ /dev/sda3 /mnt
sudo mkdir -p /mnt/home
sudo mount -o subvol=@home /dev/sda3 /mnt/home
sudo mkdir -p /mnt/boot
sudo mount /dev/sda1 /mnt/boot
sudo swapon /dev/sda2
```

### Step 4: Install the System
```bash
# Run the installation script
curl -O https://raw.githubusercontent.com/Ahmed-chouaya/milos_qt/main/nixos-config/install.sh
chmod +x install.sh
./install.sh
```

The script will:
1. Clone the configuration repository
2. Generate hardware configuration for your specific laptop
3. Ask you to review the hardware config
4. Build and install the entire system

### Step 5: Review Hardware Configuration
After the first run, you'll see:
```
✅ Generated hosts/hardware-configuration.nix
📝 Please review and edit it if needed, then run this script again:
   cd $HOME/nixos-config && ./install.sh
```

**You MUST review the hardware config:**
```bash
cd $HOME/nixos-config
nano hosts/hardware-configuration.nix
```

Look for:
- Correct disk devices (/boot, /, swap)
- Graphics drivers (GPU, Intel/AMD/NVIDIA)
- Network interfaces

### Step 6: Complete Installation
```bash
# Run installation again
./install.sh
```

### Step 7: Reboot
```bash
sudo reboot
```

## 🎯 What Happens After Reboot

1. **greetd** will start automatically
2. **tuigreet** will show a login prompt
3. **Niri** will launch automatically (no login needed - configured for user "ahmed")
4. **milos-qt** will start as your desktop environment

## 🖥️ System Features

### ✅ Included:
- **Niri window manager** (Wayland)
- **milos-qt desktop** with neobrutalist UI
- **Timezone**: Africa/Tunis
- **Keyboard**: AZERTY (French layout)
- **Auto-login**: User "ahmed" (no password required for sudo)
- **Essential packages**: git, firefox, alacritty, rofi, etc.

### 🎮 Basic Usage:
- **Super + Enter**: Open terminal
- **Super + D**: Application launcher (rofi)
- **Super + Shift + Q**: Exit application
- **Alt + Tab**: Switch windows
- **Super + Arrow keys**: Workspace navigation

## 🔧 Post-Installation Commands

### Update System:
```bash
cd $HOME/nixos-config
sudo nixos-rebuild switch --flake .#niri-host
```

### Add Packages:
Edit `home/default.nix` and add to `home.packages`:
```nix
home.packages = with pkgs; [
  milos-qt
  eza
  # Add new packages here
];
```

### Check Services:
```bash
# Check milos-qt desktop
systemctl --user status milos-qt

# Check Niri
systemctl status greetd
```

## 🐛 Troubleshooting

### If Desktop Doesn't Start:
1. Switch to TTY: `Ctrl + Alt + F2`
2. Login as user `ahmed`
3. Start manually: `milos-qt`
4. Check logs: `journalctl --user -u milos-qt`

### If Network Issues:
```bash
# Configure WiFi
sudo nmtui

# Check network status
nmcli device status
```

### If Build Fails:
```bash
# Clean and rebuild
cd $HOME/nixos-config
sudo nixos-rebuild switch --flake .#niri-host --impure
```

## 📁 Important Files

Your configuration is at: `$HOME/nixos-config/`

- `hosts/default.nix`: System configuration
- `home/default.nix`: User packages and settings  
- `hosts/hardware-configuration.nix`: Hardware-specific settings
- `install.sh`: Re-installation script

## 🎉 Enjoy Your New Desktop!

You now have a minimal, fast NixOS system with the milos-qt desktop environment!