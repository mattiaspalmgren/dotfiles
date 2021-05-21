brew-arm() {
  HOMEBREW_NO_ENV_FILTERING=1 /opt/homebrew/bin/brew $@
}

brew() {
  arch -x86_64 /usr/local/bin/brew $@
}
