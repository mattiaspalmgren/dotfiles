JETBRAINS_BASE_DIR=~/Library/Application\ Support/JetBrains
DOTFILES_BASE_DIR=~/dev/dotfiles/jetbrains

PRODUCT=$(ls "$JETBRAINS_BASE_DIR" | grep "\d" | fzf)
[[ ! -n "$PRODUCT" ]] && echo "No product selected." && exit 1

echo "Configuring: $PRODUCT"

DIRS=(
  codestyles
  keymaps
  options
  templates
)

for DIR in "${DIRS[@]}"; do
  JETBRAINS_DIR="$JETBRAINS_BASE_DIR/$PRODUCT/$DIR"
  DOTFILES_DIR="$DOTFILES_BASE_DIR/$DIR"

  [ -d "$JETBRAINS_DIR" ] && rm -r "$JETBRAINS_DIR"
  echo "Symlyncing $DOTFILES_DIR to $JETBRAINS_DIR"
  ln -s "$DOTFILES_DIR" "$JETBRAINS_DIR"
done
