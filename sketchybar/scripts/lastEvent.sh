#! /bin/bash

osascript <<EOF
set nextEventInfo to ""
tell application "Calendar"
    set now to current date
    set theCalendars to calendars
    set soonestDate to (current date) + (60 * 60 * 24 * 365 * 100)
    set soonestEvent to missing value

    repeat with cal in theCalendars
        set evts to (every event of cal whose start date ≥ now)
        repeat with e in evts
            if (start date of e) < soonestDate then
                set soonestDate to start date of e
                set soonestEvent to e
            end if
        end repeat
    end repeat

    if soonestEvent is not missing value then
        set theSummary to summary of soonestEvent
        set theStartDate to start date of soonestEvent
        set nextEventInfo to theSummary & " at " & time string of theStartDate
    end if
end tell
return nextEventInfo
EOF
