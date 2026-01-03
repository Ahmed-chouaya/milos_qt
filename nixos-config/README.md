# Minimal NixOS Niri + Milos-QT Configuration

## Quick Install

### 1. Boot from NixOS Minimal ISO

### 2. Partition and Format (if needed)

```bash
# Example for /dev/sda - adjust for your disk
sudo sgdisk -Z /dev/sda
sudo sgdisk -n 1:0:+512M -t 1:ef00 -c 1:"EFI" /dev/sda
sudo sgdisk -n 2:0:+4G -t 2:8200 -c 2:"swap" /dev/sda
sudo sgdisk -n 3:0:0 -t 3:8300 -c 3:"nixos" /dev/sda

# Format
sudo mkfs.fat -F 32 /dev/sda1
sudo mkswap /dev/sda2
sudo mkfs.btrfs /dev/sda3

# Create subvolumes
sudo mount /dev/sda3 /mnt
sudo btrfs subvolume create /mnt/@
sudo btrfs subvolume create /mnt/@home
sudo umount /mnt

# Mount
sudo mount -o subvol=@ /dev/sda3 /mnt
sudo mkdir -p /mnt/home
sudo mount -o subvol=@home /dev/sda3 /mnt/home
sudo mkdir -p /mnt/boot
sudo mount /dev/sda1 /mnt/boot
sudo swapon /dev/sda2
```

### 3. One-Command Installation

```bash
# Edit the REPO_URL in install.sh first, then run:
curl -O https://raw.githubusercontent.com/ahmedchouaya/milos-nixos/main/install.sh
chmod +x install.sh
./install.sh
```

The script will:
- Clone this repository
- Generate hardware configuration
- Install the system
- Prompt you to reboot

### 4. Reboot

```bash
sudo reboot
```

## After First Boot

Niri will start automatically and milos-qt will launch as your desktop environment.

### Manual Start (if needed)

```bash
# Start Niri manually
niri

# Start milos-qt in Niri
milos-qt
```

### Check Services

```bash
# Check milos-qt service
systemctl --user status milos-qt

# View logs
journalctl --user -u milos-qt
```

## Directory Structure

```
.
├── flake.nix                 # Main flake configuration
├── install.sh               # Automated installation script
├── hosts/
│   ├── default.nix          # System configuration (Niri + Tunisia locale)
│   └── hardware-configuration.nix  # Generated from nixos-generate-config
├── home/
│   └── default.nix          # Home-manager config for milos-qt
└── README.md                # This file
```

## Configuration Details

- **Timezone**: Africa/Tunis
- **Keyboard**: AZERTY (French layout)
- **Desktop**: Niri + milos-qt (auto-start)
- **User**: ahmed (with wheel, networkmanager, audio, video groups)

## Customization

### Add More Packages

Edit `home/default.nix` and add to `home.packages`:

```nix
home.packages = with pkgs; [
  milos-qt
  firefox
  vscode
  # Add more packages here
];
```

### Configure Niri

Niri configuration is done via environment variables or config file.
Create `~/.config/niri/config.kdl` for Niri config.

### Update System

```bash
cd /etc/nixos
sudo nixos-rebuild switch --flake .#niri-host
```

## Troubleshooting

### No Display

- Ensure you're in a TTY, not SSH
- Check GPU drivers are installed
- Run `niri --no-x11` to test

### Milos-QT Not Starting

```bash
# Check if built
which milos-qt

# Run with verbose output
QT_DEBUG_PLUGINS=1 milos-qt

# Check logs
journalctl -u milos-qt
```

### Build Issues

```bash
# Clean build
rm -rf result
nix build --impure

# Check for errors
nix --log-format bar build --impure
```

## Resources

- [NixOS Wiki](https://nixos.org/wiki)
- [Niri README](https://github.com/yawnoc/niri)
- [Home Manager Manual](https://nix-community.github.io/home-manager/)
- [Milos-QT GitHub](https://github.com/ahmedchouaya/milos-qt)
