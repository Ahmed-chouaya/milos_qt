#!/usr/bin/env bash
set -e

echo "=== NixOS Niri + Milos-QT Installation ==="

# Configuration
REPO_URL="https://github.com/Ahmed-chouaya/milos_qt.git"
CONFIG_DIR="$HOME/nixos-config"

# Clone repo if not exists
if [ -f "install.sh" ]; then
    echo "Running from existing configuration..."
else
    # Clone repo if not exists
    if [ ! -d "$CONFIG_DIR" ]; then
        echo "Cloning configuration..."
        git clone "$REPO_URL" "$CONFIG_DIR"
    fi
    
    cd "$CONFIG_DIR"
fi

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

echo "🔧 Building and installing system..."

# Check if milos-qt input is available and flake can be evaluated
if ! nix flake show --json >/dev/null 2>&1; then
    echo "⚠️  milos-qt repository not found, installing without milos-qt for now..."
    echo "📝 This will install NixOS + Niri, you can add milos-qt manually later"
    
    # Temporary install without milos-qt dependency
    sudo nixos-rebuild switch --impure
    
    echo ""
    echo "✅ NixOS + Niri installation complete!"
    echo "📝 To add milos-qt later:"
    echo "   1. Clone milos-qt: git clone https://github.com/Ahmed-chouaya/milos_qt.git"
    echo "   2. Build milos-qt: cd milos-qt && nix build"
    echo "   3. Update flake.nix to reference local milos-qt"
else
    sudo nixos-rebuild switch --flake .#niri-host
fi

echo ""
echo "✅ Installation complete!"
echo "🔄 Reboot to use your new system:"
echo "   sudo reboot"
echo ""
echo "After reboot, Niri will start automatically."