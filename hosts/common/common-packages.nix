{ inputs, pkgs, unstablePkgs, ... }:
let
  inherit (inputs) nixpkgs nixpkgs-unstable;
in
{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    nixpkgs-unstable.legacyPackages.${pkgs.system}.beszel
    nixpkgs-unstable.legacyPackages.${pkgs.system}.talosctl

    ## stable
    #act
    #ansible
    #btop
    #coreutils
    #diffr # Modern Unix `diff`
    #difftastic # Modern Unix `diff`
    #drill
    #du-dust # Modern Unix `du`
    #dua # Modern Unix `du`
    #duf # Modern Unix `df`
    #entr # Modern Unix `watch`
    #esptool
    #figurine
    #git-crypt
    #gnused
    #go
    #hugo
    #iperf3
    #ipmitool
    #mc
    #mosh
    #nmap
    #qemu
    #skopeo
    #smartmontools
    #television
    #terraform
    
    fd
    stow
    fastfetch
    gh
    ffmpeg
    tree
    unzip
    watch
    wget
    wireguard-tools
    zoxide
    kubectl
    jetbrains-mono # font
    ripgrep-all # replace and improve: ripgrep
    yq-go # replace and improve: jq
    go-task # replace and improve: just
    mise
    gum
    bun
    uv
    rclone
    atuin
    syncthing-macos

    # requires nixpkgs.config.allowUnfree = true;
    # VSCODE: MS Extensions (Base)
    vscode-extensions.ms-vscode-remote.remote-ssh
    vscode-extensions.ms-vscode-remote.remote-containers
    #vscode-extensions.MS-CEINTL.vscode-language-pack-fr
    #vscode-extensions.zokugun.vsix-manager
    # VSCODE: Other Extensions
    #vscode-extensions.PKief.material-icon-theme
    #vscode-extensions.alefragnani.project-manager
    #vscode-extensions.WordPressPlayground.wordpress-playground
  ];
}
