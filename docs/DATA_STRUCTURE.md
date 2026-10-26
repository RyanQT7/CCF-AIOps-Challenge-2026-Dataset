# Observed data structure

## Archive hierarchy

The source ZIP contains the following logical hierarchy:

```text
phase-two-data-processed-final.zip
└── phase-two-data-processed-final/
    ├── <site>_<start>_<end>.tar.gz       (24 partition archives)
    └── [macOS resource-fork sidecars]   (packaging metadata)
```

The exact site and time-window strings are intentionally omitted. Across the 24 partition archives, the inventory contains 120 CSV files, all with the `.csv` extension. Their combined uncompressed size, as recorded by tar headers, is 43,248,636,487 bytes (40.28 GiB).

Each of the five header schemas below appeared in 24 files. Descriptions are based on the field names and do not claim undocumented units or domain semantics. No row values are included here.

## CSV schema inventory

### 1. Flow-record fields

| Field | Neutral description |
| --- | --- |
| `minute_utc` | Minute timestamp; the field name indicates UTC |
| `region_code`, `region` | Region code and region label |
| `node_key`, `node` | Node-related identifiers or labels |
| `node_type` | Node type label |
| `interface_id` | Interface identifier |
| `if_role` | Interface role label |
| `collector_port` | Collector port value |
| `protocol` | Protocol value |
| `src_addr`, `dst_addr` | Source and destination address values |
| `src_port`, `dst_port` | Source and destination port values |
| `packets`, `bytes` | Packet and byte counts |
| `flow_record_count` | Flow-record count |
| `first_seen`, `last_seen` | First and last observed timestamps |

### 2. Host-resource fields

| Field | Neutral description |
| --- | --- |
| `timestamp` | Timestamp |
| `region` | Region label |
| `node` | Node label or identifier |
| `node_type` | Node type label |
| `cpu_usage` | CPU-usage value |
| `load1`, `load5` | Load values with windows indicated by their names |
| `memory_available_ratio` | Available-memory ratio |
| `swap_used_ratio` | Swap-used ratio |
| `disk_read_rate`, `disk_write_rate` | Disk read and write rate values |
| `disk_io_util` | Disk I/O utilization value |
| `filesystem_used_ratio` | Filesystem-used ratio |
| `inode_used_ratio` | Inode-used ratio |
| `open_fd_ratio` | Open-file-descriptor ratio |
| `process_count` | Process count |

### 3. Network-interface fields

| Field | Neutral description |
| --- | --- |
| `timestamp` | Timestamp |
| `region` | Region label |
| `node` | Node label or identifier |
| `node_type` | Node type label |
| `interface_id` | Interface identifier |
| `if_role` | Interface role label |
| `rx_bytes_rate`, `tx_bytes_rate` | Receive and transmit byte-rate values |
| `rx_packets_rate`, `tx_packets_rate` | Receive and transmit packet-rate values |
| `rx_drop_rate`, `tx_drop_rate` | Receive and transmit drop-rate values |
| `rx_error_rate`, `tx_error_rate` | Receive and transmit error-rate values |
| `carrier_changes` | Carrier-change value |

### 4. Generic metric fields

| Field | Neutral description |
| --- | --- |
| `timestamp` | Timestamp |
| `region` | Region label |
| `node` | Node label or identifier |
| `node_type` | Node type label |
| `metric_name` | Metric name |
| `label` | Label value |
| `value` | Metric value; unit and type are not specified by the header |

### 5. Scrape-status fields

| Field | Neutral description |
| --- | --- |
| `timestamp` | Timestamp |
| `region` | Region label |
| `target_id` | Target identifier |
| `node` | Node label or identifier |
| `exporter_type` | Exporter type label |
| `scrape_up` | Scrape status value |
| `scrape_duration_seconds` | Scrape duration in seconds, as indicated by the field name |
| `scrape_samples` | Scraped sample count |
| `scrape_error` | Scrape error value |

## Identifier and value handling

The CSV schemas include address-related fields (`src_addr`, `dst_addr`) and node or target identifier fields (`node_key`, `node`, `target_id`, and `interface_id`). This document lists schema labels only. It intentionally excludes their data values, exact partition names, and example rows. Public release remains pending confirmation that those values may be disclosed.
