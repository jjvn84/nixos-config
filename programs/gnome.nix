{ pkgs, ... }:
{

  home.packages = with pkgs; [
    # Gnome Extensions
    gnomeExtensions.random-wallpaper
    gnomeExtensions.tiling-shell
    gnomeExtensions.vitals

  ];

  # Configure Gnome
  dconf = {
    enable = true;
    settings = {
      # Dark mode
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
      # Add maximize and minimize buttons to windows
      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:minimize,maximize,close";
      };
      "org/gnome/shell" = {
        # Set which apps show up in the dock
        favorite-apps = [
          "google-chrome.desktop"
          "org.gnome.Calendar.desktop"
          "org.gnome.Nautilus.desktop"
        ];
        # disable-user-extensions must be false to run external extensions
        disable-user-extensions = false;

        # Array of extension UUIDs you want to be turned on
        enabled-extensions = [
          "Vitals@CoreCoding.com"
          "randomwallpaper@iflow.space"
          "tilingshell@ferrarodomenico.com"
        ];

        "extensions/vitals/hot-sensors" = [
          "_processor_usage_"
          "_memory_usage_"
          "__network-rx_max__"
        ];
      };
    };
  };
}
