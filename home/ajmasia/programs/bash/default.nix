{ ... }:
let
  HOME_PATH = builtins.getEnv "HOME";

  initExtraConfig = ''
    # Init extra config
    export PATH="$HOME/.local/bin:$PATH"
  '';

  profileExtraConfig = ''
    # Profile extra config
  '';

in
{
  programs.bash = {
    enable = true;

    initExtra = initExtraConfig;
    profileExtra = profileExtraConfig;

    historyIgnore = [ "ls" "cd" "exit" ];
    shellOptions = [ "histappend" "checkwinsize" "extglob" "globstar" "checkjobs" "autocd" ];
  };

}


