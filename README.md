# CCF AIOps Challenge 2026 Dataset — Phase Two (Processed)

This repository documents the processed Phase Two dataset associated with the CCF AIOps Challenge 2026. It provides dataset metadata, a structural inventory, checksums, and scripts for obtaining and validating the release artifacts.

## Dataset at a glance

- **Phase:** Phase Two
- **Processing status:** Processed data, as supplied in the source archive
- **Source archive:** `phase-two-data-processed-final.zip`
- **Archive size:** 2,445,263,119 bytes (2.28 GiB)
- **Archive contents:** 24 partition archives containing 120 CSV files across five recurring schemas
- **Expanded CSV size:** 43,248,636,487 bytes (40.28 GiB)
- **Release tag:** `phase-two-v1.0`

## Download the dataset

The public **CCF AIOps Challenge 2026 - Phase Two Dataset** release is available at [GitHub Releases](https://github.com/RyanQT7/CCF-AIOps-Challenge-2026-Dataset/releases/tag/phase-two-v1.0). It contains two ZIP parts and a SHA256 manifest:

| Release asset | Size |
| --- | ---: |
| [phase-two-data-processed-final.zip.part-00](https://github.com/RyanQT7/CCF-AIOps-Challenge-2026-Dataset/releases/download/phase-two-v1.0/phase-two-data-processed-final.zip.part-00) | 1,258,291,200 bytes |
| [phase-two-data-processed-final.zip.part-01](https://github.com/RyanQT7/CCF-AIOps-Challenge-2026-Dataset/releases/download/phase-two-v1.0/phase-two-data-processed-final.zip.part-01) | 1,186,971,919 bytes |
| [SHA256SUMS](https://github.com/RyanQT7/CCF-AIOps-Challenge-2026-Dataset/releases/download/phase-two-v1.0/SHA256SUMS) | 319 bytes |

Both ZIP parts are below 2 GiB. The Git repository contains documentation and scripts; the data binaries are distributed as Release assets rather than through Git history.

### Download, merge, and verify

The download script retrieves the manifest and both parts. The merge script reconstructs the original ZIP, and the verification script checks the part and archive SHA256 values followed by ZIP CRC validation:

```bash
./scripts/download.sh ./dataset
./scripts/merge.sh ./dataset ./dataset/phase-two-data-processed-final.zip
./scripts/verify.sh ./dataset ./dataset/SHA256SUMS ./dataset/phase-two-data-processed-final.zip
```

Linux users may also download the assets directly and run the verification commands:

```bash
mkdir -p dataset
release_url='https://github.com/RyanQT7/CCF-AIOps-Challenge-2026-Dataset/releases/download/phase-two-v1.0'
curl -fL -o dataset/phase-two-data-processed-final.zip.part-00 "$release_url/phase-two-data-processed-final.zip.part-00"
curl -fL -o dataset/phase-two-data-processed-final.zip.part-01 "$release_url/phase-two-data-processed-final.zip.part-01"
curl -fL -o dataset/SHA256SUMS "$release_url/SHA256SUMS"
cat dataset/phase-two-data-processed-final.zip.part-00 dataset/phase-two-data-processed-final.zip.part-01 > dataset/phase-two-data-processed-final.zip
(cd dataset && sha256sum -c SHA256SUMS)
unzip -t dataset/phase-two-data-processed-final.zip
```

Expected SHA256 for the reconstructed source archive:

```text
b667e9ce6159fb9b380326a902957090b9bbae035561e5099a75ae34b0cb9016
```

## Directory structure

The outer ZIP groups data by site and time window. Exact partition names and sample values are omitted from this README.

```text
phase-two-data-processed-final.zip
└── phase-two-data-processed-final/
    └── <site>_<start>_<end>.tar.gz  (24 partition archives)
        └── CSV files                (120 total, five recurring schemas)
```

The CSV payload totals 43,248,636,487 bytes (40.28 GiB). See [docs/DATASET.md](docs/DATASET.md) for the dataset overview and extraction instructions, and [docs/DATA_STRUCTURE.md](docs/DATA_STRUCTURE.md) for the observed schema and column inventory.

## Repository contents

- `docs/DATASET.md` — dataset description, inventory, extraction, and distribution details
- `docs/DATA_STRUCTURE.md` — observed archive hierarchy and CSV column inventory
- `scripts/download.sh` — downloads the Release assets with retries
- `scripts/merge.sh` — reconstructs the ZIP from numbered parts
- `scripts/verify.sh` — checks SHA256 digests and ZIP CRC
- `checksums/SHA256SUMS` — SHA256 digests for the source archive and prepared parts

## Scope and attribution

This repository does not define a challenge task, labels, evaluation protocol, or scientific claim. No license or citation metadata was present in the inspected source materials; this repository does not assign a license or invent a citation. Consult the challenge organizers for authoritative terms and attribution information.
