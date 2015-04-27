#!/bin/sh
HOSTNAME='staging'
DEBUG='true'



for f in $(find hooks/* -maxdepth 1 -executable -type f ! -iname "*.md" ! -iname ".*" | sort --numeric-sort); do
    if [ "$DEBUG" == 'true' ]; then
        read -p "Continue with $f (y/n)?" WORK
        if [ "$WORK" != "y" ]; then
            exit 0
        else
            . $f
        fi
    else
        . $f
    fi
done
