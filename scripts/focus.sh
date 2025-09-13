tell application "System Events"
    repeat with p in {"SecurityAgent", "CoreServicesUIAgent", "loginwindow"}
        if exists process p then
            tell process p
                if windows is not {} then
                    set frontmost to true
                    exit repeat
                end if
            end tell
        end if
    end repeat
end tell
