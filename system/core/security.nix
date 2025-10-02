{
  security.rtkit.enable = true;
  security.polkit.enable = true;
  security.sudo.enable = true;

  security.pam.loginLimits = [
    {
      domain = "*";
      type = "soft";
      item = "nofile";
      value = 65536;
    }
    {
      domain = "*";
      type = "hard";
      item = "nofile";
      value = 65536;
    }
  ];
}
