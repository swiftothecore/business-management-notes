#!/bin/bash
# Swap a newly downloaded business-notes-vNN.html into the tracked file,
# commit it, and push. Run from anywhere.
set -e
REPO="/Users/corey/Documents/Business Management Notes"

# Use the file passed as $1, or auto-detect the newest business-notes-v*.html
# dropped straight into the repo folder (excludes the tracked business-notes.html itself)
if [ -n "$1" ]; then
  SRC="$1"
else
  SRC=$(ls -t "$REPO"/business-notes-v*.html 2>/dev/null | head -1)
fi

if [ -z "$SRC" ] || [ ! -f "$SRC" ]; then
  echo "No source file found. Usage: update-notes.sh [path-to-new-file.html]"
  exit 1
fi

VERSION=$(basename "$SRC" .html | sed -E 's/.*-v([0-9]+).*/v\1/')
cd "$REPO"

if diff -q "$SRC" business-notes.html >/dev/null 2>&1; then
  echo "No changes — $SRC is identical to the current business-notes.html"
  rm -f "$SRC"
  exit 0
fi

cp "$SRC" business-notes.html
git add business-notes.html
git commit -q -m "${2:-$VERSION}"
git push -q
rm -f "$SRC"

echo "Updated to $VERSION, committed, pushed, and removed $SRC"
