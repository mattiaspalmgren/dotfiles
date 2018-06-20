local usbWatcher = nil

function usbDeviceCallback(data)
    if (data["productName"] == "USB Receiver") then
        if (data["eventType"] == "added") then
            hs.execute("/Library/Application\\ Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli --select-profile 'Logitech'")
            hs.notify.new({title="Hammerspoon", informativeText="Keyboard profile changed to Logitech"}):send()
        elseif (data["eventType"] == "removed") then
            hs.execute("/Library/Application\\ Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli --select-profile 'Apple'")
            hs.notify.new({title="Hammerspoon", informativeText="Keyboard profile changed to Apple"}):send()
        end
    end
end

usbWatcher = hs.usb.watcher.new(usbDeviceCallback)
usbWatcher:start()
