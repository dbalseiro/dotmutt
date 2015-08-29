#!/bin/bash
set -e

function parseMail() {
    python -c "import email.utils; print email.utils.parseaddr('$1')"
}

grep "^From:" | head -1 | cut -f2 -d: |  
if read sender; then
    parseMail "$sender" | sed s/[\(\)\,]//g | xargs ~/.mutt/confirmContact
fi
