# SSH Hardening Automation

This project provides automated SSH hardening for Linux servers, following best practices for security, system administration, and DevOps workflows. The goal is to improve SSH security, automate firewall and Fail2Ban setup, create a limited user, and generate an audit report, while maintaining rollback capability.

## Features

- Automatic system updates
- Firewall configuration with UFW
- Fail2Ban setup and configuration
- SSH hardening:
  - Disable root login
  - Disable password authentication
  - Enable public key authentication
- User creation for limited privileges
- Audit report generation
- Safe rollback support

## Project Structure

```text
ssh-hardening/
├── README.md
├── scripts/
│   ├── common.sh
│   ├── logging.sh
│   ├── firewall.sh
│   ├── fail2ban.sh
│   ├── ssh.sh
│   ├── users.sh
│   └── audit.sh
├── configs/
│   ├── sshd-hardening.conf
│   └── fail2ban-jail.local
├── harden.sh
├── rollback.sh
├── .env.example