# Hardware configuration template
# Run: sudo nixos-generate-config --dir /etc/nixos
# Then copy the generated hardware-configuration.nix here

{ config, pkgs, lib, modulesPath, ... }:

{
  imports = [ ];

  boot.initrd.availableKernelModules = [ "vfat" "btrfs" "ext4" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "btrfs";
  };

  swapDevices = [ ];

  networking.useDHCP = lib.mkDefault true;
  networking.interfaces.enp0s3.useDHCP = lib.mkDefault true;

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
