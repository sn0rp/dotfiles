#!/usr/bin/env bash
# checkupdates (pacman-contrib) uses a temp database, so it never leaves you
# in the partial-upgrade state a bare `pacman -Sy` would.
repo=$(checkupdates 2>/dev/null | wc -l || true)
aur=$(paru -Qua 2>/dev/null | wc -l || true)
total=$(( repo + aur ))
if (( total > 0 )); then
  notify-send -u normal "Updates available" \
    "$repo repo, $aur AUR — run: paru -Syu"
fi
