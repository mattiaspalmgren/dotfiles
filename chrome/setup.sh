EXTENSION_FILE=~/dev/dotfiles/chrome/extensions.md
cat $EXTENSION_FILE | perl -ne '/- \[.*]\((.*)\)/ && print "\"$1\"\n";' | xargs open -a 'Google Chrome'
