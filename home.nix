{pkgs, lib, config, ...}: {
  imports = [
    ./common.nix
  ];

  config = {
    home.username = "dgramop";
    home.homeDirectory = "/Users/dgramop";
    common = {
      enable = true;
      email = "dgramopadhye@gmail.com";
      name = "Dhruv Gramopadhye";
    };

    home.packages = with pkgs; [
      darwin.lsusb
      gnuradio
      pkg-config
      ghidra-bin
    ];

    programs.ssh = {
      enable = true;
      # the "2BUA8C4S2C" part of the path is well-defined and likely to remain consistent. it is a
      # team identifier for all 1password/agilebits applications - and isn't randomly generated per
      # install
      extraConfig = ''
        Host btlst
            Hostname 10.56.0.4

        Host *
            IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
      '';
    };

    programs.git.extraConfig = {
      gpg = {
        format = "ssh";
      };
      "gpg \"ssh\"" = {
        program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      };
      commit = {
        gpgsign = true;
      };
      user = {
        signingKey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCljmP0GXaGu97J/vOE5kvlKZt262sqx2ADiN0Glt5dMjiP4ubQLmC4vUr4rajV/n1JcTJzp12LSNmIVUQKLZgxLpwKhk7W7EAElT2rCMj6Yr1c2P5B34nGCyDYPjMWahupkZafLHze9zWxtkH+fHicH4GtOXMW4R9nZycwqtefAUsWBSbG023rYgzO9lUz8ZPb846CgwxWdtDoOdf15O58IrRfrWF3QKzWErli3OZ5K4cu70D55xCyGG9+Gpozf1u0kTF80jCb24TNr2CELEo8rqVXmJeVqA5LO1g5putLzzeTt8XL6tBjT2Wu0eQAAVOODee51QXCQ8dM29HaT7rbodeWEBrfAIY0V8FsjGQSpQv0VmcDzTyQH7Se29Pd6kPYP8M3VjPoTK+RMHSOdgTPY7iAgUo5c5qhs4DA3vXI+CgaEopL3AiKOtycYOhkMB/HGcQZiZ126BCRlr7exeM7d5/XQsNjhuLjyAnOxsWNA8DI0IvmRflakka2gVqEYRk=";
      };
    };
  };
}
