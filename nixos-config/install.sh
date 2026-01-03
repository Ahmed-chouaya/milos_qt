#!/usr/bin/env bash
set -e

echo "=== NixOS Niri + Milos-QT Installation ==="

# Configuration
REPO_URL="https://github.com/ahmedchouaya/milos-nixos.git"
CONFIG_DIR="$HOME/nixos-config"

# Clone repo if not exists
if [ ! -d "$CONFIG_DIR" ]; then
    echo "Cloning configuration..."
    git clone "$REPO_URL" "$CONFIG_DIR"
fi

cd "$CONFIG_DIR"

# Check if hardware config exists
if [ ! -f "hosts/hardware-configuration.nix" ]; then
    echo "Generating hardware configuration..."
    sudo nixos-generate-config --dir /tmp/nixos-hardware
    sudo cp /tmp/nixos-hardware/hardware-configuration.nix hosts/
    echo ""
    echo "✅ Generated hosts/hardware-configuration.nix"
    echo "📝 Please review and edit it if needed, then run this script again:"
    echo "   cd $CONFIG_DIR && ./install.sh"
    echo ""
    exit 0
fi

echo "🔧 Installing system..."
sudo nixos-rebuild switch --flake .#niri-host

echo ""
echo "✅ Installation complete!"
echo "🔄 Reboot to use your new system:"
echo "   sudo reboot"
echo ""
echo "After reboot, Niri will start automatically and milos-qt will launch."