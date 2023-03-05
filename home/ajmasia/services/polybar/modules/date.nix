{ pkgs, ... }:

let
  name = "date";
  type = "internal/date";

  colors = pkgs.callPackage ../utils/colors.nix { };
in
''
  [module/${name}]
  type = ${type}

  # core
  interval = 1.0
  time = "%H:%M"
  date = "%a %d %B"

  # label
  label = %time%  %date%
  label-font = 19

  # format
  format = <label>
''

