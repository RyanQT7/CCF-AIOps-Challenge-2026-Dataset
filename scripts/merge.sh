#!/usr/bin/env bash
set -euo pipefail

if [[ $# -gt 2 ]]; then
  echo "Usage: $0 [parts-directory] [output-zip]" >&2
  exit 2
fi
if [[ $# -ge 1 ]]; then
  part_dir=$1
else
  part_dir=.
fi
if [[ $# -ge 2 ]]; then
  output=$2
else
  output="$part_dir/phase-two-data-processed-final.zip"
fi
if [[ ! -d "$part_dir" ]]; then
  echo "Parts directory does not exist: $part_dir" >&2
  exit 1
fi
mkdir -p "$(dirname "$output")"
if [[ -e "$output" ]]; then
  echo "Refusing to overwrite existing output: $output" >&2
  exit 1
fi

shopt -s nullglob
parts=("$part_dir"/phase-two-data-processed-final.zip.part-[0-9][0-9])
if [[ ${#parts[@]} -eq 0 ]]; then
  echo "No numbered ZIP parts found in $part_dir" >&2
  exit 1
fi

index=0
for part in "${parts[@]}"; do
  expected="phase-two-data-processed-final.zip.part-$(printf '%02d' "$index")"
  if [[ $(basename "$part") != "$expected" ]]; then
    echo "Parts must be numbered contiguously from 00; expected $expected" >&2
    exit 1
  fi
  index=$((index + 1))
done

tmp="$output.tmp.$$"
trap 'rm -f "$tmp"' EXIT
for part in "${parts[@]}"; do
  cat "$part" >> "$tmp"
done
mv "$tmp" "$output"
trap - EXIT
echo "Merged $index part file(s) into $output"
