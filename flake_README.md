# Nix Flake Setup

This flake requires nix to be installed on NixOS.

## First-time Setup

Run these commands to initialize the flake:

```bash
cd /home/ahmed/milos_qt/.worktrees/initial-setup
nix flake lock
nix develop
```

## Development

Enter development shell with Qt6 tools:
```bash
nix develop
```

Build the application:
```bash
nix build
```

Run the application:
```bash
./result/bin/milos-qt
```

## Building on NixOS

Add to your system flake:
```nix
{
  inputs.milos-qt.url = "path/to/milos-qt";
  
  outputs = { self, nixpkgs, milos-qt }: {
    homeConfigurations.user = nixpkgs.lib.nixosSystem {
      modules = [
        milos-qt.nix.home-manager.nix
        ({ pkgs, ... }: {
          programs.milos-qt.enable = true;
        })
      ];
    };
  };
}
```
