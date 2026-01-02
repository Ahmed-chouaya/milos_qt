{ config, pkgs, lib, ... }:

let
  milos-qt = import ../default.nix { inherit pkgs; };
in
{
  options = {
    programs.milos-qt = {
      enable = lib.mkEnableOption "Enable milos-qt neobrutalist desktop";
      package = lib.mkOption {
        type = lib.types.path;
        default = milos-qt;
        description = "milos-qt package to use";
      };
      autoStart = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Start milos-qt automatically on login";
      };
    };
  };

  config = lib.mkIf config.programs.milos-qt.enable {
    home.packages = [ config.programs.milos-qt.package ];

    xdg.desktopEntries.milos-qt = {
      name = "Milos-QT";
      genericName = "Neobrutalist Desktop";
      comment = "Customizable Qt6 desktop environment";
      exec = "milos-qt";
      terminal = false;
      categories = "System;";
    };

    systemd.user.services.milos-qt = lib.mkIf config.programs.milos-qt.autoStart {
      Unit = {
        Description = "Milos-QT Desktop";
        After = ["graphical-session-pre.target"];
        Wants = ["graphical-session-pre.target"];
      };
      Service = {
        ExecStart = "${config.programs.milos-qt.package}/bin/milos-qt";
        Restart = "on-failure";
        Environment = ["QT_QPA_PLATFORM=wayland"];
      };
      Install = {
        WantedBy = ["graphical-session.target"];
      };
    };
  };
}
