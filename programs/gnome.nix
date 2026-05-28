{ pkgs, lib, ... }:
{

  home.packages = with pkgs; [
    # Dconf editor
    dconf-editor

    # Gnome Extensions
    gnomeExtensions.paperwm
    gnomeExtensions.random-wallpaper
    # gnomeExtensions.tiling-shell
    gnomeExtensions.vitals

  ];

  # Configure Gnome
  dconf = {
    enable = true;
    settings = {
      # Dark mode
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        accent-color = "teal";
      };
      # Add maximize and minimize buttons to windows
      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:minimize,maximize,close";
      };
      "org/gnome/shell" = {
        # Set which apps show up in the dock
        favorite-apps = [
          "google-chrome.desktop"
          "slack.desktop"
          "org.gnome.Calendar.desktop"
          "org.gnome.Nautilus.desktop"
          "code.desktop"
        ];
        # disable-user-extensions must be false to run external extensions
        disable-user-extensions = false;

        # Array of extension UUIDs you want to be turned on
        enabled-extensions = [
          "Vitals@CoreCoding.com"
          "randomwallpaper@iflow.space"
          # "tilingshell@ferrarodomenico.com"
          "paperwm@paperwm.github.com"
        ];

      };

      # Configure stats for Vitals extension
      "org/gnome/shell/extensions/vitals" = {
        hot-sensors = [
          "_processor_usage_"
          "_memory_usage_"
          "__network-rx_max__"
        ];
      };

      # Configure PaperWM
      "org/gnome/shell/extensions/paperwm" = {
        horizontal-margin = lib.hm.gvariant.mkInt32 6;
        selection-border-size = lib.hm.gvariant.mkInt32 6;
        show-workspace-indicator = false;
        vertical-margin = lib.hm.gvariant.mkInt32 6;
        vertical-margin-bottom = lib.hm.gvariant.mkInt32 6;
        window-gap = lib.hm.gvariant.mkInt32 6;
      };
    };
  };
}
