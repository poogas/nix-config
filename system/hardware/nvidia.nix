{ pkgs, config, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    open = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;

    modesetting.enable = true;

    nvidiaSettings = false;
    nvidiaPersistenced = false;

    powerManagement = {
      enable = true;
      finegrained = true;
      offload.enable = true;
    };
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      vaapiVdpau
      libvdpau
      libva
      vdpauinfo
    ];
  };
}
