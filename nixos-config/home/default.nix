{ pkgs, milos-qt, ... }:

{
  home.username = "ahmed";
  home.homeDirectory = "/home/ahmed";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    milos-qt
    eza
  ];

  home.shellAliases = {
    ll = "eza -l --icons";
    la = "eza -la --icons";
    gs = "git status";
    gc = "git commit";
    gp = "git push";
    gl = "git log --oneline";
  };

  programs.home-manager.enable = true;

  systemd.user.services.milos-qt = {
    Unit = {
      Description = "Milos-QT Desktop";
      After = ["graphical-session.target"];
      PartOf = ["graphical-session.target"];
    };
    Service = {
      ExecStart = "${milos-qt}/bin/milos-qt";
      Restart = "on-failure";
      Environment = ["QT_QPA_PLATFORM=wayland"];
    };
    Install = {
      WantedBy = ["graphical-session.target"];
    };
  };

  xdg.desktopEntries.milos-qt = {
    name = "Milos-QT";
    genericName = "Neobrutalist Desktop";
    comment = "Customizable Qt6 desktop environment";
    exec = "${milos-qt}/bin/milos-qt";
    terminal = false;
    categories = "System;";
  };
}
