#!/bin/bash
trap "\n echo exiting...; exit" SIGHUP SIGINT SIGTERM

i="kitty"

yay -Q | grep "$i-*.pkg.tar.zst"
exit


