#!/bin/sh
# Test basic functionality

set -e

proram=$0
TMPDIR=${TMPDIR:-/tmp}
TMPBASE=$TMPDIR/tmp.$$
CURDIR=.

case "$0" in
  */*)
        CURDIR=${0%/*}
        ;;
esac

AtExit ()
{
    rm -rf "$TMPBASE"*
}

Run ()
{
    echo "$*"
    shift
    eval "$@"
}

trap AtExit 0 1 2 3 15

# #######################################################################

name=example.cc
file="$(cd $CURDIR ; echo $(pwd)/$name)"
dir="$TMPBASE.cccc"

mkdir -p "$dir"
cp "$file" "$dir"

cd $dir
Run "%% TEST cccc:" cccc $name
lynx -dump .cccc/cccc.html

# End of file
