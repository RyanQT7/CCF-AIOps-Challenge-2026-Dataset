#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 || $# -gt 3 ]]; then
  echo "Usage: $0 ARTIFACT-DIRECTORY [SHA256SUMS] [ZIP-FILE]" >&2
  exit 2
fi
artifact_dir=$1
if [[ $# -ge 2 ]]; then
  manifest=$2
else
  manifest="$artifact_dir/SHA256SUMS"
fi
if [[ $# -ge 3 ]]; then
  archive=$3
else
  archive="$artifact_dir/phase-two-data-processed-final.zip"
fi
if [[ ! -d "$artifact_dir" ]]; then
  echo "Artifact directory does not exist: $artifact_dir" >&2
  exit 1
fi
if [[ ! -f "$manifest" ]]; then
  echo "Checksum manifest not found: $manifest" >&2
  exit 1
fi
if [[ ! -f "$archive" ]]; then
  echo "Reconstructed ZIP not found: $archive" >&2
  exit 1
fi
command -v sha256sum >/dev/null || { echo "sha256sum is required." >&2; exit 1; }
command -v unzip >/dev/null || { echo "unzip is required." >&2; exit 1; }

manifest_name=$(basename "$manifest")
(
  cd "$artifact_dir"
  sha256sum -c "$manifest_name"
)
unzip -t "$archive" >/dev/null
echo "SHA256 checks passed and ZIP CRC validation succeeded."
