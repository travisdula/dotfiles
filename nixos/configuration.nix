# Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:
{
  imports = [
    <home-manager/nixos>
    <nixos-hardware/lenovo/thinkpad/x1/6th-gen>
    /etc/nixos/hardware-configuration.nix
  ];

  boot.loader = {
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
  };

  environment = {
    sessionVariables = {
      GTK_THEME = "Nordic";
    };

    systemPackages = with pkgs; [
      brightnessctl
      discord
      dmenu
      eza
      fd
      flameshot
      gcc
      gimp
      gnumake
      gotop
      htop
      libreoffice
      mpv
      nemo
      nordic # Nord theme
      obsidian
      pandoc
      pavucontrol
      prismlauncher
      pulsemixer
      python3
      ripgrep
      signal-desktop
      spotify
      swi-prolog
      sxiv
      texlive.combined.scheme-small
      thunderbird
      unzip
      wget
      xclip # needed for nvim unnamedplus clipboard
      yazi
      zathura
      zip
      zoom-us
      zotero
    ];
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    jetbrains-mono
    nerd-fonts.jetbrains-mono
  ];

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    trackpoint = {
      enable = true;
      speed = 255;
    };
  };

  home-manager = {
    users.travis = import /home/travis/dotfiles/home-manager/home.nix;
    backupFileExtension = ".bak";
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  location.provider = "geoclue2";

  networking = {
    hostName = "thethinker";
    networkmanager.enable = true;
  };

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 21d";
    };
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  nixpkgs.config.allowUnfree = true;

  programs.fish.enable = true;

  services = {
    ntp.enable = true;
    fprintd = {
      enable = true;
      tod = {
        enable = true;
        driver = pkgs.libfprint-2-tod1-goodix;
      };
    };

    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };

    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      windowManager.qtile.enable = true;
      displayManager.lightdm = {
        extraConfig = "user-authority-in-system-dir = true\n";
        enable = true;
      };
    };

    libinput = {
      enable = true;
      mouse.accelProfile = "flat";
      touchpad = {
        accelProfile = "adaptive";
        disableWhileTyping = true;
      };
    };

    picom.enable = true;

    redshift = {
      enable = true;
      brightness = {
        day = "1";
        night = "0.8";
      };
      temperature = {
        day = 5500;
        night = 3700;
      };
    };

    unclutter-xfixes = {
      enable = true;
      extraOptions = [ "noevents" ];
    };

    blueman.enable = true;
  };

  system.stateVersion = "23.11"; # Only update on new installs

  time.timeZone = "America/Chicago";

  users.users.travis = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "Travis A. Dula";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  xdg.mime.defaultApplications = {
    "application/pdf" = "org.pwmt.zathura-pdf-mupdf.desktop";
    "image/*" = "sxiv.desktop";
  };
}
