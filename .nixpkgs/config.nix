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
        pythonPackages.udiskie
        lxappearance
        breeze-icons nixos-icons vanilla-dmz
      ];
    };

    media-env = with pkgs; buildEnv {
      name = "media-env";
      paths = [
        pasystray pavucontrol pamixer
        vlc
        cdparanoia flac
        exfat
      ];
    };

    net-env = with pkgs; buildEnv {
      name = "net-env";
      paths = [
        firefox
        unstable.enpass
        networkmanagerapplet
        bind traceroute
        transmission-gtk
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
        emacs25-nox unstable.vscode unstable.jetbrains.idea-ultimate eclipses.eclipse-platform
        gitAndTools.hub tig
        go upx unstable.dep gnumake
        unstable.rustup clang
        scala sbt
        jq ripgrep
      ];
    };

    work-env = with pkgs; buildEnv {
      name = "work-env";
      paths = [
        chefdk vagrant
        gradle groovy
        packer
        unstable.slack unstable.zoom-us skypeforlinux
        unstable.terraform_0_11
        awscli google-cloud-sdk
        git-crypt
      ];
    };
  };
}
