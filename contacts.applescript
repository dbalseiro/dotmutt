#! /usr/bin/osascript
on run (arguments)
    set l to {}
    tell application "Contacts"
        repeat with p in people
            if name of p contains (first item of arguments) then 
                repeat with e in (get value of emails of p)
                    log e & "\t" & name of p
                end repeat
            end if
        end repeat
    end tell
end run

