{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;



  networking.hostName = "niri";
  networking.networkmanager.enable = true;

  time.timeZone = "Africa/Tunis";
  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "fr";
  };

  services.xserver.enable = false;

  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  environment.systemPackages = with pkgs; [
    niri
    wayland
    wl-clipboard
    grim
    slurp
    mako
    libnotify
    rofi
    alacritty
    firefox
    helix
    git
    curl
    wget
    unzip
    zip
    tar
    gzip
    bzip2
    xz
    greetd.tuigreet
  ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd niri";
        user = "ahmed";
      };
    };
  };

  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = false;

  users.users.ahmed = {
    isNormalUser = true;
    description = "Ahmed";
    extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
  };

  system.stateVersion = "24.11";
}
