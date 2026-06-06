{ config, pkgs, ... }:
let
  # 1. Create a configured version of pkgs specifically for the Android builder
  configuredPkgs = import pkgs.path {
    inherit (pkgs) system;
    config = {
      allowUnfree = true;
      android_sdk.accept_license = true;
    };
  };

  # 2. Use that configured version here to build your global environment
  globalAndroidEnv = configuredPkgs.androidenv.composeAndroidPackages {
    includeEmulator = true;
    includeSystemImages = true;

    platformVersions = [ "34" ];
    buildToolsVersions = [ "34.0.0" ];

    systemImageTypes = [ "google_apis" ];
    abiVersions = [ "x86_64" ];
  };
in
{

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./programs/gnome.nix
    ./programs/vscode.nix
  ];

  home.username = "juan";
  home.homeDirectory = "/home/juan";

  home.packages = with pkgs; [
    # Android emulator
    globalAndroidEnv.androidsdk
    android-tools # Provides global command-line utilities like adb

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
    dioxus-cli # CLI tool for Dioxus, a Rust-based UI framework
    direnv # Tool that allows you to automatically load and unload environment variables based on the current directory
    bruno # API client
    nil # LSP server for the nix language
    nixd # LSP server for the nix language
    nixfmt # Formatter for .nix files

  ];

  # Session variables so your terminal commands always know where to look
  home.sessionVariables = {
    ANDROID_HOME = "${globalAndroidEnv.androidsdk}/libexec/android-sdk";
    ANDROID_SDK_ROOT = "${globalAndroidEnv.androidsdk}/libexec/android-sdk";
  };

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
