#!/bin/sh
CONTENTDIR=${1:-$PWD}
TARGET="$CONTENTDIR/001_recent"

CONTENTDIR=${CONTENTDIR%/}

process () {
	local TARGET
	TARGET="$TARGET/$1"
	[ -d "$TARGET" ] && find -L "$TARGET" -mindepth 1 \( -xtype l \( -type l -o -mtime +$2 \) -o -type d -empty \) -delete
	find -H "$CONTENTDIR" -type f -mtime -$2 -printf '%h\0%p\0' | xargs -0 -xn 2 sh -c 'tgt="'"$TARGET"'/${2#$1}"; [ -d "$tgt" ] || mkdir -p "$tgt"; ln -srt "$tgt" "$3" 2> /dev/null; true' -- "$CONTENTDIR"
}

process 00_day 1
process 01_week 7
process 02_month 30