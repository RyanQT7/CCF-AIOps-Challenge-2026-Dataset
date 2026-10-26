# Dataset overview

## Identification

| Item | Observed or supplied value |
| --- | --- |
| Dataset | CCF AIOps Challenge 2026 dataset |
| Phase | Phase Two |
| Processing state | Processed data, as named and supplied in the source archive |
| Source artifact | `phase-two-data-processed-final.zip` |
| Planned distribution version | `phase-two-v1.0` |
| Source archive size | 2,445,263,119 bytes (2.28 GiB) |
| Inner CSV inventory | 120 files, 43,248,636,487 bytes (40.28 GiB) |
| Partition archives | 24 gzip-compressed tar archives |

The archive's internal contents have not been modified. The figures above were derived from the archive directory and tar headers. They describe file counts and stored byte sizes; no row count is asserted.

## Contents and scope

The outer ZIP contains a directory of 24 partition archives. The inventory contains 120 CSV files across five recurring schemas; each schema was observed in 24 files. The archive also includes macOS resource-fork sidecar entries; these are packaging metadata rather than additional CSV datasets.

The files expose infrastructure-oriented telemetry and records through their column names. The documentation records field names and neutral, name-based descriptions only. It does not publish data rows, address values, node values, or other sample identifiers. Field units and detailed semantics are not asserted unless stated explicitly by a field name.

This repository does not infer labels, challenge task definitions, evaluation rules, or scientific conclusions from the files. No license, citation, or formal data dictionary was included in the inspected source materials.

## Size and package layout

- Original ZIP: 2,445,263,119 bytes (2.28 GiB)
- Prepared parts: two files, 1,258,291,200 bytes and 1,186,971,919 bytes
- CSV payload size from the tar headers: 43,248,636,487 bytes (40.28 GiB)
- CSV count: 120
- Partition count: 24

The repository's [SHA256SUMS](../checksums/SHA256SUMS) contains the expected SHA256 for the source ZIP and each prepared part. The two numbered parts and a copy of this checksum manifest are available from the [phase-two-v1.0 GitHub Release](https://github.com/RyanQT7/CCF-AIOps-Challenge-2026-Dataset/releases/tag/phase-two-v1.0).

## Download, merge, and validation

After the planned release is published, run these commands from the repository checkout:

```bash
./scripts/download.sh ./dataset
./scripts/merge.sh ./dataset ./dataset/phase-two-data-processed-final.zip
./scripts/verify.sh ./dataset ./dataset/SHA256SUMS ./dataset/phase-two-data-processed-final.zip
```

The final command checks all part and archive digests listed in the downloaded manifest, then runs `unzip -t` over the reconstructed ZIP to verify its CRC records. The source archive's expected SHA256 is:

```text
b667e9ce6159fb9b380326a902957090b9bbae035561e5099a75ae34b0cb9016
```

## Extracting the CSV files

Once the reconstructed ZIP has passed verification, extract the outer ZIP and then unpack each partition into its own directory:

```bash
mkdir -p dataset/outer dataset/csv
unzip -q dataset/phase-two-data-processed-final.zip -d dataset/outer
for archive in dataset/outer/phase-two-data-processed-final/*.tar.gz; do
  name=$(basename "$archive" .tar.gz)
  mkdir -p "dataset/csv/$name"
  tar -xzf "$archive" -C "dataset/csv/$name"
done
```

The partition filenames contain site and time-window metadata. They are represented generically in this documentation to avoid disclosing infrastructure-specific identifiers.

## Distribution status

The public release is titled **CCF AIOps Challenge 2026 - Phase Two Dataset** and uses tag `phase-two-v1.0`. Its two ZIP parts and checksum manifest are hosted as Release assets. No dataset binaries are stored in this Git repository.
