# CCF AIOps Challenge 2026 Dataset — Phase Two (Processed)

This repository documents the processed Phase Two dataset associated with the CCF AIOps Challenge 2026. It provides dataset metadata, a structural inventory, checksums, and scripts for obtaining and validating the release artifacts.

## Dataset at a glance

- **Phase:** Phase Two
- **Processing status:** Processed data, as supplied in the source archive
- **Source archive:** `phase-two-data-processed-final.zip`
- **Archive size:** 2,445,263,119 bytes (2.28 GiB)
- **Archive contents:** 24 partition archives containing 120 CSV files across five recurring schemas
- **Expanded CSV size:** 43,248,636,487 bytes (40.28 GiB)
- **Planned release tag:** `phase-two-v1.0`

The prepared Release artifact uses two numbered parts, each below 2 GiB. Part sizes and SHA256 digests are listed in [checksums/SHA256SUMS](checksums/SHA256SUMS). See [docs/DATASET.md](docs/DATASET.md) for the data overview and [docs/DATA_STRUCTURE.md](docs/DATA_STRUCTURE.md) for the observed directory layout and CSV fields.

## Data availability

The release assets are not published at this time. The inspected data contains network address and node-identifier fields, and public disclosure authorization has not been confirmed. The repository therefore contains documentation and release-preparation metadata only; it does not contain the ZIP, its parts, or extracted CSV files.

If public distribution is authorized and the planned release is published, the artifacts can be downloaded, merged, and checked with:

```bash
./scripts/download.sh ./dataset
./scripts/merge.sh ./dataset ./dataset/phase-two-data-processed-final.zip
./scripts/verify.sh ./dataset ./dataset/SHA256SUMS ./dataset/phase-two-data-processed-final.zip
```

The download script targets the planned GitHub Release tag. It will succeed only after that release and its assets are published.

## Repository contents

- `docs/DATASET.md` — dataset description, scope, inventory, and distribution status
- `docs/DATA_STRUCTURE.md` — observed archive layout and CSV column inventory
- `scripts/download.sh` — downloads the planned release assets
- `scripts/merge.sh` — reconstructs the ZIP from numbered parts
- `scripts/verify.sh` — checks SHA256 digests and ZIP CRC
- `checksums/SHA256SUMS` — SHA256 digests for the source archive and prepared parts

## Scope and attribution

This repository does not define a challenge task, labels, evaluation protocol, or scientific claim. No license or citation metadata was present in the inspected source materials; this repository does not assign a license or invent a citation. Consult the challenge organizers for authoritative terms and attribution information.
