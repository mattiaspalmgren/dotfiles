require('karabiner')

hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", hs.reload):start()