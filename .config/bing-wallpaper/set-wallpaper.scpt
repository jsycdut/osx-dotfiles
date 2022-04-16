
tell application "System Events"
    set desktopCount to count of desktops
    repeat with desktopNumber from 1 to desktopCount
        tell desktop desktopNumber
            set picture to "/Users/corona/github/osx-dotfiles/.config/bing-wallpaper/wallpaper.jpg"
        end tell
    end repeat
end tell
