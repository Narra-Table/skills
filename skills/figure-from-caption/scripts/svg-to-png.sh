#!/usr/bin/env bash
# Batch convert all SVGs in a directory to PNG using rsvg-convert.
# Usage: svg-to-png.sh <svg-dir> [width] [bg-color]
#   width:    output PNG width in px (default 1440)
#   bg-color: background color for PNG (default #f8f9fb, slightly off-white)
# PNGs are written to <svg-dir>/png/ with the .svg suffix stripped.

set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <svg-dir> [width] [bg-color]" >&2
  exit 1
fi

SVG_DIR="$1"
WIDTH="${2:-1440}"
BG="${3:-#f8f9fb}"

if ! command -v rsvg-convert >/dev/null 2>&1; then
  echo "Error: rsvg-convert not installed." >&2
  echo "Install via: brew install librsvg" >&2
  exit 2
fi

if [[ ! -d "$SVG_DIR" ]]; then
  echo "Error: directory not found: $SVG_DIR" >&2
  exit 3
fi

mkdir -p "$SVG_DIR/png"

shopt -s nullglob
svgs=("$SVG_DIR"/*.svg)
if [[ ${#svgs[@]} -eq 0 ]]; then
  echo "No .svg files found in $SVG_DIR" >&2
  exit 4
fi

count=0
for f in "${svgs[@]}"; do
  base="$(basename "$f" .svg)"
  out="$SVG_DIR/png/${base}.png"
  rsvg-convert -w "$WIDTH" -b "$BG" "$f" -o "$out"
  echo "✓ $base.svg → png/${base}.png"
  count=$((count + 1))
done

echo "---"
echo "Converted $count file(s) to $SVG_DIR/png/ (width=${WIDTH}, bg=${BG})"
