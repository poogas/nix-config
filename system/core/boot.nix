{
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
      efi.canTouchEfiVariables = true;
    };

    initrd.verbose = false;
    consoleLogLevel = 0;
    kernelParams = [ "quiet" "udev.log_level=0" ];

    plymouth = {
      enable = true;
      theme = "spinner";
      extraConfig = ''
        DeviceScale=1
      '';
    };
  };
}
