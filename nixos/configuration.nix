# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{
  imports =
    [ 
      <home-manager/nixos>
      <nixos-hardware/lenovo/thinkpad/x1/6th-gen>
      ./hardware-configuration.nix # Include the results of the hardware scan.
    ];
  

  boot.loader = {
    grub = {
      enable = true;
      devices = ["nodev"];
      efiSupport = true;
      useOSProber = true;
    };
    #systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot/efi";
  };

  networking = {
    hostName = "thethinker"; # Define your hostname.
    networkmanager.enable = true;
    # Open ports in the firewall.
    # firewall.allowedTCPPorts = [ ... ];
    # firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # firewall.enable = false;
    # working.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };


  # Set your time zone.
  time.timeZone = "America/Chicago";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
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

  #virtualisation = {
  #  docker = {
  #    enable = true;
  #    rootless = {
  #      enable = true;
  #      setSocketVariable = true;
  #    };
  #  };
  #};

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
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;
      #extraConfig.pipewire."92-low-latency";
    };

    xserver = {
      xkb.layout = "us";
      xkb.variant = "";
      enable = true;
      windowManager.qtile = {
        enable = true;
        #backend = "wayland"; # TODO wayland
      };
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

  location.provider = "geoclue2";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.travis = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "Travis A. Dula";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [];
  };

  home-manager.users.travis = import /home/travis/dotfiles/home-manager/home.nix;
  programs = {
    fish.enable = true;
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    jetbrains-mono
    nerd-fonts.jetbrains-mono
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment = {
    sessionVariables = rec {
      GTK_THEME = "Nordic"; # Adwaita:dark if don't want Nord
    };

    systemPackages = with pkgs; [
      brightnessctl
      discord
      dmenu
      eza
      fd
      firefox# to be configured via home-manager
      flameshot
      gcc
      gimp
      git # home-manager
      gnumake
      gotop
      htop
      kitty # home-manager
      libreoffice
      mpv
      nemo
      neovim # home-manager
      nordic # Nord theme
      obsidian
      pandoc
      pavucontrol
      pulsemixer
      python3
      ripgrep
      signal-desktop
      spotify
      stow
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

  xdg.mime.defaultApplications = {
    "application/pdf" = "org.pwmt.zathura-pdf-mupdf.desktop";
    "image/*" = "sxiv.desktop";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 21d";
    };
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };
}
