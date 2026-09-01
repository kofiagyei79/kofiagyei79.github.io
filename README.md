# My Cybersecurity Portfolio

Welcome to my cybersecurity project portfolio. This repository showcases my technical skills, hands-on lab setups, attack analyses, and security documentation. 

## 🌐 Live Portfolio Website
View my live portfolio site here: [kofiagyei79.github.io](https://kofiagyei79.github.io)

---

## 🛠️ Technical Security Skills & Tools

* **Network Scanning & Enumeration:** Nmap
* **Vulnerability Assessment & Exploitation:** Metasploit Framework
* **Traffic & Packet Analysis:** Wireshark
* **SIEM & Security Analytics:** Splunk Enterprise
* **Perimeter Defense & Routing:** pfSense, IPsec VPN
* **Testing Methodologies:** Black Box Testing, Hybrid Range Blue-Teaming, Attack Vector Analysis
* **Documentation:** Technical Security Reporting, Presentation Delivery

---

## 🚀 Project 1: Black Box Hacking Simulation (Capstone)

### Project Overview
This project involved simulating a real-world cyberattack on a completely blind "black box" system to identify critical vulnerabilities. The objective was to research potential attack vectors, safely exploit system weaknesses, and document defensive remediation measures.

### Core Phases Execution

#### 1. Reconnaissance & Scanning (Nmap)
* Used **Nmap** to perform network discovery and map out active hosts.
* Conducted service version detection (`-sV`) and OS fingerprinting (`-O`) to identify open ports and potential entry points.

#### 2. Packet Analysis & Monitoring (Wireshark)
* Captured live network traffic using **Wireshark** during the initial scanning phases.
* Analyzed protocols and packet payloads to identify unencrypted text or unusual traffic patterns.

#### 3. Vulnerability Exploitation (Metasploit)
* Cross-referenced open port services against known CVE databases.
* Utilized the **Metasploit Framework** to select, configure, and execute precise payloads against identified system vulnerabilities.

#### 4. Documentation & Reporting
* Authored comprehensive security documentation detailing the step-by-step attack chain.
* Created actionable remediation steps to patch the exploited vulnerabilities and harden the system.

### 📂 Project 1 Assets
📄 **Presentation:** [Download Capstone Presentation](./Presentation1Black%20Box%20system%20testing.pptx)

---

## 🚀 Project 2: Enterprise Hybrid Lab & Splunk SIEM Engineering

### Project Overview
This project demonstrates the design, deployment, and testing of a multi-subnet corporate architecture built inside EVE-NG. The objective is to evaluate perimeter defensive capabilities by routing Red Team exploitation sequences across a site-to-site VPN tunnel while aggregating system and network logs into a central Splunk Enterprise SIEM instance.

### Core Phases Execution

#### 1. Network Boundary Segmentation & Zero-Trust Architecture
* Implemented a multi-interface **pfSense** gateway to enforce strict isolation between production assets, DMZs, and remote offices.
* Established an encrypted **IPsec Site-to-Site VPN** tunnel to securely route traffic from remote enclaves into the corporate backbone.

#### 2. Offensive Security Assessments (Red Team)
* **Reconnaissance:** Executed targeted Nmap discovery scans from the remote `Kali Linux` node (`10.1.1.10`) across the VPN to find open services inside the LAN.
* **Exploitation & Lateral Movement:** Compromised unpatched application-layer services on the target LAN machine (`192.168.60.131`) and established pivoting routes to audit the isolated DMZ zone (`10.3.3.10`).
* **Web Security Testing:** Used directory enumeration and traffic analysis to identify input parsing bugs and SQL Injection (SQLi) pathways on the corporate `SAMAMTV` web asset (`192.168.60.50`).

#### 3. Defensive Security Analytics & Detection Engineering (Blue Team)
* **Log Ingestion Pipeline:** Configured `Splunk Universal Forwarders` on endpoints to harvest Linux authentication records (`linux_secure`), web daemon streams (`access_combined`), and host shell histories (`bash_history`).
* **Threat Detection Architecture:** Developed custom Splunk Processing Language (SPL) rules to trigger high-fidelity alerts for network port scanning baselines, active SSH brute-force handshakes, and SQL injection strings.

### 📂 Project 2 Assets
* 💻 **Source Code/Scripts:** [View Splunk inputs.conf & savedsearches.conf](./defensive-blue-team/splunk/)

---

## 📩 Contact & Connect

* **Email:** kofiagyei79@gmail.com
* **GitHub:** [kofiagyei79](https://github.com)
* **LinkedIn:** [Kofi Agyei](https://linkedin.com)

© 2026 Kofi Agyei
