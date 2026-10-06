# Defensive Cyber

Personal notes, host-survey command lists, and small helper scripts for defensive work: incident response, host forensics, Windows/Linux/Solaris collection, and SANS SEC504 lab notes.

This is not a GitHub profile page. It is a working notebook. Treat every script as something to run only on systems you own or are explicitly authorized to assess.

## Layout

| Path | What is in it |
| --- | --- |
| [`incident-response/`](incident-response/) | Spot-report template for first-pass incident writeups |
| [`scripts/`](scripts/) | Lab/setup helpers (tool bootstrap, ping sweep, Solaris PID-by-port) |
| [`device-surveys/`](device-surveys/) | Command checklists for Windows, Unix, and Solaris live response |
| [`forensics/`](forensics/) | Malware/forensics notes and Volatility 3 command snippets |
| [`powershell-audit/`](powershell-audit/) | Windows remote collection and enumeration scripts |
| [`redhat/`](redhat/) | CentOS/RHEL host facts dumped toward JSON for SIEM ingest |
| [`solarwinds/`](solarwinds/) | SUNBURST/TEARDROP detection artifacts (YARA + Snort) |
| [`sec504/`](sec504/) | SEC504 course notes, mixed defensive and lab/offensive material |

## Incident response

- [`incident-response/spot-report.txt`](incident-response/spot-report.txt) — fill-in template: detection, systems, hypothesis, remediation.

## Scripts

- [`scripts/build-defender-tools.sh`](scripts/build-defender-tools.sh) — apt/snap/git bootstrap for a Linux analysis box.
- [`scripts/ping-sweep.sh`](scripts/ping-sweep.sh) — simple ICMP sweep of a `/24` (lab/recon helper).
- [`scripts/solaris-get-port-pid.sh`](scripts/solaris-get-port-pid.sh) — map a TCP/UDP port to a PID on Solaris via `pfiles`.

## Device surveys

Live-response command lists (no automation). Use the version that matches the host OS.

- [`device-surveys/windows-1.0.txt`](device-surveys/windows-1.0.txt)
- [`device-surveys/windows-2.0.txt`](device-surveys/windows-2.0.txt)
- [`device-surveys/unix-1.0.txt`](device-surveys/unix-1.0.txt)
- [`device-surveys/unix-2.0.txt`](device-surveys/unix-2.0.txt)
- [`device-surveys/solaris-1.0.txt`](device-surveys/solaris-1.0.txt)

## Forensics

- [`forensics/forensics.md`](forensics/forensics.md) — packing, strings/FLOSS, lab VMs.
- [`forensics/volatility.md`](forensics/volatility.md) — Volatility 3 process/network/dump workflow.

## PowerShell audit

- [`powershell-audit/audit.ps1`](powershell-audit/audit.ps1) — remote host collection (logs, shares, processes, etc.).
- [`powershell-audit/automater.ps1`](powershell-audit/automater.ps1) — runs `audit.ps1` against `computers.txt`.
- [`powershell-audit/enum.ps1`](powershell-audit/enum.ps1) — local Windows enumeration (Z3R0th).
- [`powershell-audit/jaws-enum.ps1`](powershell-audit/jaws-enum.ps1) — JAWS-style Windows enum.

## Red Hat / CentOS

- [`redhat/centos-5.7-enum-to-json.sh`](redhat/centos-5.7-enum-to-json.sh) — host commands formatted as JSON fragments for Splunk/Kibana.

## SolarWinds (SUNBURST)

Copied detection content from FireEye's public SUNBURST countermeasures:

- [`solarwinds/teardrop-dropper.yar`](solarwinds/teardrop-dropper.yar)
- [`solarwinds/sunburst.rules`](solarwinds/sunburst.rules)

## SEC504 notes

Course notebook. Defensive pieces and lab/offensive technique notes live side by side.

**Defense / detection**

- [`sec504/living-off-land-defense.md`](sec504/living-off-land-defense.md)
- [`sec504/deepblue.md`](sec504/deepblue.md)
- [`sec504/rita.md`](sec504/rita.md)
- [`sec504/differential-analysis.ps1`](sec504/differential-analysis.ps1)
- [`sec504/volatility.md`](sec504/volatility.md)
- [`sec504/malware-analysis.md`](sec504/malware-analysis.md)

**Cloud and recon notes**

- [`sec504/cloud-buckets.md`](sec504/cloud-buckets.md)
- [`sec504/cloud-post.md`](sec504/cloud-post.md)
- [`sec504/cloud-scan.md`](sec504/cloud-scan.md)
- [`sec504/bucket-list.txt`](sec504/bucket-list.txt)
- [`sec504/dns-enum.md`](sec504/dns-enum.md)
- [`sec504/custom-wordlist-dns.md`](sec504/custom-wordlist-dns.md)
- [`sec504/nmap.md`](sec504/nmap.md)
- [`sec504/smb.md`](sec504/smb.md)
- [`sec504/netcat.md`](sec504/netcat.md)

**Lab / offensive course notes** (authorized training environments only)

- [`sec504/hijacking.md`](sec504/hijacking.md)
- [`sec504/metasploit.md`](sec504/metasploit.md)
- [`sec504/password-attacks.md`](sec504/password-attacks.md)
- [`sec504/pivoting.md`](sec504/pivoting.md)
- [`sec504/post-exploitation.md`](sec504/post-exploitation.md)
- [`sec504/python-meterpreter.md`](sec504/python-meterpreter.md)
- [`sec504/data-exfil.md`](sec504/data-exfil.md)
- [`sec504/web-apps-embedded-systems-attacks.md`](sec504/web-apps-embedded-systems-attacks.md)
- [`sec504/api-bypass-ip-restrictions.md`](sec504/api-bypass-ip-restrictions.md)
- [`sec504/local-password-spray.ps1`](sec504/local-password-spray.ps1)
- [`sec504/cookiecatcher.php`](sec504/cookiecatcher.php)
- [`sec504/shellcode.cs`](sec504/shellcode.cs)
