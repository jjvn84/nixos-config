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
        arrterian.nix-env-selector
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
        # Viewers
        ms-toolsai.datawrangler
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "autopep8";
          publisher = "ms-python";
          version = "2026.6.0";
          sha256 = "sha256-3n/SRVmaQ41F3291CFADj6oNf+zVnoN9ljmwy2DRfbU=";
        }
        {
          name = "dioxus";
          publisher = "dioxuslabs";
          version = "0.7.3";
          sha256 = "sha256-FwHjYjFy0Dk0i7G+Y8htwXKk2+lAqol2lTNkK4zzrd8=";
        }
        {
          name = "vscode-opentofu";
          publisher = "opentofu";
          version = "0.6.3";
          sha256 = "sha256-q1Em4j1vlwCKcoXWRUArVkGlAMIrGb9onJBWlUFjRgU=";
        }
        {
          name = "path-autocomplete";
          publisher = "ionutvmi";
          version = "1.26.0";
          sha256 = "sha256-DVHAhQnc78yf1dwjmRxhWNYCsSiYlvJlmqhtO4jKofE=";
        }
        {
          name = "sqltools";
          publisher = "mtxr";
          version = "0.28.6"; # Adjust version if a newer one is live
          sha256 = "sha256-SpVFH+Qf9tpnNm4J5z3fOhWzzYP0LknDNm88JHMxkIU=";
        }
      ];
    # Set the theme in userSettings
    profiles.default.userSettings = {
      "editor.formatOnSave" = true;
      "workbench.colorTheme" = "Dark Modern";
      "python.analysis.typeCheckingMode" = "standard";

      # The marketplace VSIX bundles an ARM64 `tofu-ls`, which fails on x86_64
      # with exit code 126 ("cannot execute binary file"). Point the extension
      # at the x86_64 builds from Nix instead.
      "opentofu.languageServer.path" = "${pkgs.tofu-ls}/bin/tofu-ls";
      "opentofu.languageServer.tofu.path" = "${pkgs.opentofu}/bin/tofu";
    };
  };
}
