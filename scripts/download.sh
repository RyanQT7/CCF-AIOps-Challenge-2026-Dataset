#!/usr/bin/env bash
set -euo pipefail

repo='RyanQT7/CCF-AIOps-Challenge-2026-Dataset'
tag='phase-two-v1.0'
if [[ $# -gt 1 ]]; then
  echo "Usage: $0 [destination-directory]" >&2
  exit 2
fi
if [[ $# -eq 1 ]]; then
  dest=$1
else
  dest=.
fi
mkdir -p "$dest"
dest=$(cd "$dest" && pwd)
base_url="https://github.com/$repo/releases/download/$tag"

curl -fL --retry 3 --retry-delay 2 -o "$dest/SHA256SUMS" "$base_url/SHA256SUMS"
found=0
while IFS= read -r name; do
  [[ -n "$name" ]] || continue
  found=$((found + 1))
  echo "Downloading $name"
  curl -fL --retry 3 --retry-delay 2 -o "$dest/$name" "$base_url/$name"
done < <(awk '$2 ~ /\.zip\.part-[0-9][0-9]$/ { print $2 }' "$dest/SHA256SUMS")

if [[ $found -eq 0 ]]; then
  echo "No numbered ZIP parts were listed in SHA256SUMS." >&2
  exit 1
fi
echo "Downloaded $found part file(s) and SHA256SUMS into $dest"
