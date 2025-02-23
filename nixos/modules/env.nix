{
  environment.sessionVariables = rec {
    TERMINAL = "alacritty";
    EDITOR = "nvim";
    XDG_BIN_HOME = "$HOME/.local/bin";
    ANDROID_HOME = "$HOME/Android/Sdk";
    ANDROID_TOOLS = "${ANDROID_HOME}/platform-tools";
    PATH = [
      "${XDG_BIN_HOME}"
      #      "${ANDROID_TOOLS}"
    ];
  };
}
