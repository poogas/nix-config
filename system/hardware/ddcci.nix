{ config, pkgs, ... }:

let
  #sudo ddcutil detect
  #I2C bus:             /dev/i2c-13  <-- ddcci_bus_number
  #cat /sys/bus/i2c/devices/i2c-13/name
  #output = ddcci_bus_name
  ddcci_bus_name = "NVIDIA i2c adapter 6 at 1:00.0";
  ddcci_bus_number = "i2c-13";
in
{
  boot.extraModulePackages = with config.boot.kernelPackages; [ ddcci-driver ]; 
  boot.kernelModules = [ "ddcci-backlight" "i2c-dev" ];

  services.udev.extraRules = let
      bash = "${pkgs.bash}/bin/bash";
    in ''
      SUBSYSTEM=="i2c", ACTION=="add", ATTR{name}=="${ddcci_bus_name}", RUN+="${bash} -c 'sleep 30; printf ddcci\ 0x37 > /sys/bus/i2c/devices/${ddcci_bus_number}/new_device'"
    '';
}
