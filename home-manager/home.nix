# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];
  nixpkgs = {
    # You can add overlays here
    
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      permittedInsecurePackages = [
                "electron-25.9.0"
              ];
  };
};
  home.username = "wogyfikacja";
  home.homeDirectory = "/home/wogyfikacja";
  home.packages = [
    pkgs.protonplus
    pkgs.firefox
    pkgs.spotify
    pkgs.vscode-fhs
    pkgs.fastfetch
    pkgs.zsh
    pkgs.vesktop
    pkgs.direnv
    pkgs.python3
    pkgs.cargo
    pkgs.pciutils
    pkgs.bibata-cursors
    pkgs.mdslides
    pkgs.obsidian
    pkgs.lutris
    pkgs.wine
    pkgs.winetricks
    pkgs.deluge
    pkgs.jdk
    pkgs.gh
    pkgs.maven
    pkgs.sqlite
    pkgs.element-desktop
    pkgs.retroarch    
    pkgs.ninja
    pkgs.meson
    pkgs.gtk4
    pkgs.libadwaita
    pkgs.json-glib
    pkgs.libsoup
    pkgs.libarchive
    pkgs.desktop-file-utils
    pkgs.libgee
  ];
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  programs.git = {
    enable = true;
    userName = "wogyfikacja";
    userEmail = "emil1bakula@gmail.com";
  };
  programs.zsh = {
  enable = true;
  enableCompletion = true;
  syntaxHighlighting.enable = true;
  enableAutosuggestions = true;
  shellAliases = {
    ll = "ls -l";
    update = "sudo nixos-rebuild switch";
  };
  history = {
    size = 10000;
    path = "${config.xdg.dataHome}/zsh/history";
  };
  oh-my-zsh = {
    enable = true;
    plugins = [ "git" ];
    theme = "robbyrussell";
  };
  };
  # Enable home-manager and git
  programs.home-manager.enable = true;
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
