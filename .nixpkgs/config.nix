let
  unstable = import <nixos-unstable> {};
in {
  allowUnfree = true;

  packageOverrides = pkgs: with pkgs; rec {

    all-envs = buildEnv {
      name = "all-envs";
      paths = [
        i3-env
        media-env
        net-env
        dev-env
        fonts-env
        work-env
      ];
    };

    i3-env = with pkgs; buildEnv {
      name = "i3-env";
      paths = [
        xsel clipit
        autorandr xorg.xbacklight
        dunst
        nitrogen
        python27Packages.py3status
        rofi
        unstable.termite
        scrot imagemagick
        neofetch
      ];
    };

    media-env = with pkgs; buildEnv {
      name = "media-env";
      paths = [
        pasystray pavucontrol pamixer
        vlc
      ];
    };

    net-env = with pkgs; buildEnv {
      name = "net-env";
      paths = [
        chromium firefox
        enpass
        networkmanagerapplet
      ];
    };

    fonts-env = with pkgs; buildEnv {
      name = "fonts-env";
      paths = [
        fira-code
        font-awesome-ttf
        powerline-fonts
      ];
    };

    dev-env = with pkgs; buildEnv {
      name = "dev-env";
      paths = [
        emacs25-nox unstable.vscode unstable.jetbrains.idea-ultimate
        gitAndTools.hub
        unstable.go_1_10 upx unstable.dep
        unstable.rustup
        unstable.elixir
        sbt gnumake
        jq ripgrep git-crypt
      ];
    };

    work-env = with pkgs; buildEnv {
      name = "work-env";
      paths = [
        chefdk vagrant
        gradle groovy
        packer
        unstable.slack unstable.zoom-us
        unstable.terraform_0_11
        python27Packages.awscli google-cloud-sdk
      ];
    };
  };
}
