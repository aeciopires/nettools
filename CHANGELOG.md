# Changelog

<!-- TOC -->

- [Changelog](#changelog)
- [3.0.0](#300)
- [2.2.0](#220)
- [2.1.0](#210)
- [2.0.0](#200)
- [1.0.0](#100)

<!-- TOC -->

# 3.0.0

Date: 11/12/2025

> This image supports the linux/amd64, linux/arm/v6, linux/arm/v7, and linux/arm64 processor architectures

- Added the follow packages:
  - apache2-utils
  - bind-tools
  - bird
  - bridge-utils
  - busybox-extras
  - dhcping
  - file
  - fping
  - gnupg
  - httpie
  - iftop
  - iperf
  - ipset
  - iptraf-ng
  - iputils-tracepath
  - ipvsadm
  - jq
  - lz4
  - net-snmp-tools
  - ngrep
  - nmap-nping
  - nmap-scripts
  - oh-my-zsh
  - openssl
  - openssh
  - scapy
  - speedtest-cli
  - strace
  - swaks
  - tcptraceroute
  - tripp
  - websocat
  - zstd
  - zsh
- Result of vulnerability scan with aquasec/trivy:

```
Report Summary

┌───────────────────────────────────────────┬────────┬─────────────────┬─────────┐
│                  Target                   │  Type  │ Vulnerabilities │ Secrets │
├───────────────────────────────────────────┼────────┼─────────────────┼─────────┤
│ aeciopires/nettools:3.0.0 (alpine 3.22.2) │ alpine │        0        │    -    │
└───────────────────────────────────────────┴────────┴─────────────────┴─────────┘
Legend:
- '-': Not scanned
- '0': Clean (no security findings detected)
```

# 2.2.0

Date: 10/28/2025

> This image supports the linux/amd64, linux/arm/v6, linux/arm/v7, and linux/arm64 processor architectures

- **alpine**: bump version from 3.21.3 to 3.22.2
- Result of vulnerability scan with aquasec/trivy:

```
Trivy Report Summary

┌───────────────────────────────────────────┬────────┬─────────────────┬─────────┐
│                  Target                   │  Type  │ Vulnerabilities │ Secrets │
├───────────────────────────────────────────┼────────┼─────────────────┼─────────┤
│ aeciopires/nettools:2.2.0 (alpine 3.22.2) │ alpine │        0        │    -    │
└───────────────────────────────────────────┴────────┴─────────────────┴─────────┘
Legend:
- '-': Not scanned
- '0': Clean (no security findings detected)
```

# 2.1.0

Date: 03/19/2025

> This image supports the linux/amd64, linux/arm/v6, linux/arm/v7, and linux/arm64 processor architectures

- **alpine**: 3.21.3
- Result of vulnerability scan with aquasec/trivy:

```
Trivy Report Summary

┌───────────────────────────────────────────┬────────┬─────────────────┬─────────┐
│                  Target                   │  Type  │ Vulnerabilities │ Secrets │
├───────────────────────────────────────────┼────────┼─────────────────┼─────────┤
│ aeciopires/nettools:2.1.0 (alpine 3.21.3) │ alpine │        0        │    -    │
└───────────────────────────────────────────┴────────┴─────────────────┴─────────┘
Legend:
- '-': Not scanned
- '0': Clean (no security findings detected)
```

# 2.0.0

Date: 12/04/2024

> This image supports the linux/amd64, linux/arm/v6, linux/arm/v7, and linux/arm64 processor architectures

- **alpine**: 3.20.3
- Result of vulnerability scan with aquasec/trivy:

```
nettools:2.0.0 (alpine 3.20.3)
==============================
Total: 2 (UNKNOWN: 0, LOW: 2, MEDIUM: 0, HIGH: 0, CRITICAL: 0)

┌────────────┬───────────────┬──────────┬────────┬───────────────────┬───────────────┬───────────────────────────────────────────────────────────┐
│  Library   │ Vulnerability │ Severity │ Status │ Installed Version │ Fixed Version │                           Title                           │
├────────────┼───────────────┼──────────┼────────┼───────────────────┼───────────────┼───────────────────────────────────────────────────────────┤
│ libcrypto3 │ CVE-2024-9143 │ LOW      │ fixed  │ 3.3.2-r0          │ 3.3.2-r1      │ openssl: Low-level invalid GF(2^m) parameters lead to OOB │
│            │               │          │        │                   │               │ memory access                                             │
│            │               │          │        │                   │               │ https://avd.aquasec.com/nvd/cve-2024-9143                 │
├────────────┤               │          │        │                   │               │                                                           │
│ libssl3    │               │          │        │                   │               │                                                           │
│            │               │          │        │                   │               │                                                           │
│            │               │          │        │                   │               │                                                           │
└────────────┴───────────────┴──────────┴────────┴───────────────────┴───────────────┴───────────────────────────────────────────────────────────┘
```

# 1.0.0

Date: 11/20/2023

> This image supports the linux/amd64, linux/arm/v6, linux/arm/v7, and linux/arm64 processor architectures

- Initial version.
- **alpine**: 3.18.4
- Result of vulnerability scan with aquasec/trivy:

```
nettools:1.0.0 (alpine 3.18.4)
==============================
Total: 0 (UNKNOWN: 0, LOW: 0, MEDIUM: 0, HIGH: 0, CRITICAL: 0)
```
