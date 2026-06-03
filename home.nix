{ config, pkgs, ... }:
{

  imports = [
    ./programs/gnome.nix
    ./programs/vscode.nix
  ];

  home.username = "juan";
  home.homeDirectory = "/home/juan";

  home.packages = with pkgs; [
    # Browsers
    brave
    google-chrome

    # Database clients
    dbeaver-bin
    mongodb-compass

    # Entertainment
    spotify

    # Messaging and communication tools
    discord
    slack
    zoom-us

    # Office tools
    drawing
    drawio
    calibre
    gnucash
    libreoffice

    # Programming tools
    direnv
    bruno
    nil # LSP server for the nix language
    nixd # LSP server for the nix language
    nixfmt # Formatter for .nix files

  ];

  # Install and configure git
  programs.git = {
    enable = true;
    settings.user.name = "Juan Vásquez";
    settings.user.email = "jjvn84@gmail.com";
  };

  # Enable Nix Helper
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep 5";
    flake = "/home/juan/.nixos-config";
  };

  # Enable and configure the Ollama service
  services.ollama = {
    enable = true;
  };

  # Enable and configure the Opencode
  programs.opencode = {
    enable = true;
  };

  # Let Home Manager manage shell/dotfiles natively
  programs.bash.enable = true;

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with.
  home.stateVersion = "25.11";
}
