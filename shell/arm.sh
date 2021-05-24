brew-arm() {
 /opt/homebrew/bin/brew $@
}

brew() {
  arch -x86_64 /usr/local/bin/brew $@
}
