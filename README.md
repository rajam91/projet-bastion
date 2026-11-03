# Bastion Project

A bastion host (SSH + RDP) deployed on VMs running on an Apple Silicon Mac (M1, ARM), built with **Apache Guacamole**, a **Samba AD** directory, **TOTP MFA** and **session recording**.

## Architecture

| VM | IP (internal `labnet` network) | Role |
|---|---|---|
| srv-ad | 10.10.10.10 | Samba AD-DC (AD / DNS / LDAP / Kerberos), domain `lab.local` |
| bastion | 10.10.10.20 | Apache Guacamole 1.6.0 (Docker: guacd + webapp + MariaDB) |
| srv-web | 10.10.10.30 | Target server (nginx + SSH) |
| user | 10.10.10.40 | User workstation (Debian + XFCE + xrdp) |

Everything runs Debian 13 ARM on VirtualBox 7.2. VirtualBox on Apple Silicon only runs ARM guests, so a real Windows Server is not an option: the directory is provided by **Samba AD-DC** instead.

## Requirements covered

- Bastion installation (Guacamole via Docker, official arm64 images)
- ADMIN / User / Dev accounts (Samba groups, Guacamole permissions)
- SSH access and RDP access
- Multi-factor authentication
- Session recording 
- LDAP authentication over LDAPS 

## Contents

- `scripts/demo.sh`: starts the VMs and waits until Guacamole responds
- `docs/captures/`: screenshots of the demo

## Secrets

Lab passwords have been replaced with placeholders


Built as a school project (Efrei).
