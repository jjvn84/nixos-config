{ pkgs, ... }:
{

  home.packages = with pkgs; [
    # Dconf editor
    dconf-editor

    # Gnome Extensions
    gnomeExtensions.paperwm
    gnomeExtensions.random-wallpaper
    gnomeExtensions.spotify-controls
    # gnomeExtensions.tiling-shell
    gnomeExtensions.vitals

  ];

  # Configure Gnome
  dconf = {
    enable = true;
    settings = {
      # Dark mode, teal accent, show weekday in top bat
      "org/gnome/desktop/interface" = {
        accent-color = "teal";
        color-scheme = "prefer-dark";
        clock-show-weekday = true;
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
          "spotify-controls@Sonath21"
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
        horizontal-margin = 6;
        selection-border-size = 6;
        show-workspace-indicator = false;
        vertical-margin = 6;
        vertical-margin-bottom = 6;
        window-gap = 6;
      };
    };
  };
}
