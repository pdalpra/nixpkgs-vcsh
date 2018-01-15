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
        dunst
        python27Packages.py3status
        rofi
        unstable.termite
        scrot imagemagick
      ];
    };

    media-env = with pkgs; buildEnv {
      name = "media-env";
      paths = [
        pasystray
        pavucontrol
        vlc
      ];
    };

    net-env = with pkgs; buildEnv {
      name = "net-env";
      paths = [
        chromium firefox
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
        emacs25-nox unstable.vscode
        gitAndTools.hub
        go upx
        rustup
        sbt
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
      ];
    };
  };
}