{pkgs, lib, config, ...}: 
let 
  common = (builtins.fetchGit {
        url = "https://github.com/dgramop/home-manager";
  } + "/common.nix");
in {
  imports = [
    common
  ];

  config = {
    home.username = "dgramop";
    home.homeDirectory = "/home/dgramop";
    common = {
      enable = true;
      email = "dgramopadhye@gmail.com";
      name = "Dhruv Gramopadhye";
    };
  };
}
