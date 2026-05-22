{ pkgs, ... }:
{

  # Install and configure Visual Studio Code
  programs.vscode = {
    enable = true;
    # Install extensions
    profiles.default.extensions =
      with pkgs.vscode-extensions;
      [
        # Container tools
        ms-azuretools.vscode-docker
        docker.docker
        ms-azuretools.vscode-containers
        # General tools
        fill-labs.dependi
        usernamehw.errorlens
        tamasfe.even-better-toml
        mhutchie.git-graph
        mechatroner.rainbow-csv
        streetsidesoftware.code-spell-checker
        # JavaScript
        esbenp.prettier-vscode
        # Nix
        jnoortheen.nix-ide
        mkhl.direnv
        # Python
        ms-python.python
        ms-python.vscode-pylance
        ms-python.pylint
        ms-python.debugpy
        ms-toolsai.jupyter
        ms-toolsai.jupyter-keymap
        ms-toolsai.jupyter-renderers
        # Remote tools
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        ms-vscode.remote-explorer
        # Rust
        rust-lang.rust-analyzer
        # Themes
        jdinhlife.gruvbox # Gruvbox theme
        # Viewers
        ms-toolsai.datawrangler
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "autopep8";
          publisher = "ms-python";
          version = "2026.4.0";
          sha256 = "sha256-pr2lIWBV1Uya09lMa8BXzVRBjP5NRzmbkuLqFwGwq/U=";
        }
        {
          name = "dioxus";
          publisher = "dioxuslabs";
          version = "0.7.3";
          sha256 = "sha256-FwHjYjFy0Dk0i7G+Y8htwXKk2+lAqol2lTNkK4zzrd8=";
        }
        {
          name = "path-autocomplete";
          publisher = "ionutvmi";
          version = "1.25.0";
          sha256 = "sha256-iz32o1znwKpbJSdrDYf+GDPC++uGvsCdUuGaQu6AWEo=";
        }
      ];
    # Set the theme in userSettings
    profiles.default.userSettings = {
      "editor.formatOnSave" = true;
      "workbench.colorTheme" = "Gruvbox Dark Hard";
    };
  };
}
