### My Cybersecurity Portfolio

Welcome to my cybersecurity project portfolio. This repository showcases my technical skills, hands-on lab setups, attack analyses, and security documentation. 

### 🌐 Live Portfolio Website

View my live portfolio site here: [kofiagyei79.github.io](/url?sa=i&source=web&rct=j&url=https://kofiagyei79.github.io&ved=2ahUKEwi37JLEktWWAxVYEFkFHRU0Bl4Qg5wRegYIAAgSEAs&opi=89978449&cd&psig=AOvVaw0Rc1cGgahDTy1ZyEtNjQMc&ust=1788618836091000) 

### 🛠️ Technical Security Skills & Tools

* **Network Scanning & Enumeration:** Nmap
* **Vulnerability Assessment & Exploitation:** Metasploit Framework
* **Traffic & Packet Analysis:** Wireshark
* **SIEM & Security Analytics:** Splunk Enterprise
* **Perimeter Defense & Routing:** pfSense, IPsec VPN
* **Testing Methodologies:** Black Box Testing, Hybrid Range Blue-Teaming, Attack Vector Analysis
* **Documentation:** Technical Security Reporting, Presentation Delivery

### 🚀 Project 1: Black Box Hacking Simulation (Capstone)

### Project Overview

This project involved simulating a real-world cyberattack on a completely blind "black box" system to identify critical vulnerabilities. The objective was to research potential attack vectors, safely exploit system weaknesses, and document defensive remediation measures. 

### Core Phases Execution

* **Reconnaissance & Scanning (Nmap)** 

  * Used Nmap to perform network discovery and map out active hosts.
  * Conducted service version detection (-sV) and OS fingerprinting (-O) to identify open ports and potential entry points.
* **Packet Analysis & Monitoring (Wireshark)** 

  * Captured live network traffic using Wireshark during the initial scanning phases.
  * Analyzed protocols and packet payloads to identify unencrypted text or unusual traffic patterns.
* **Vulnerability Exploitation (Metasploit)** 

  * Cross-referenced open port services against known CVE databases.
  * Utilized the Metasploit Framework to select, configure, and execute precise payloads against identified system vulnerabilities.
* **Documentation & Reporting** 

  * Authored comprehensive security documentation detailing the step-by-step attack chain.
  * Created actionable remediation steps to patch the exploited vulnerabilities and harden the system.

### 🟣 Purple Team Integration (Active Engineering Phase)

**Bridging Offensive Hacking with Defensive SIEM Monitoring**
To simulate realistic enterprise workflows, the attack vectors executed in this Black Box Capstone (including Nmap scanning patterns and exploitation paths) are actively being used as the baseline testing material for Project 2. This allows me to capture live attack telemetry and engineer the exact Splunk SIEM detection rules listed below. 

### 📂 Project 1 Assets

* 📄 **Presentation:** Download Capstone Presentation

### 🚀 Project 2: Enterprise Hybrid Lab & Splunk SIEM Engineering

### Project Overview

This project demonstrates the design, deployment, and testing of a multi-subnet corporate architecture built inside EVE-NG. The objective is to evaluate perimeter defensive capabilities by routing Red Team exploitation sequences across a site-to-site VPN tunnel while aggregating system and network logs into a central Splunk Enterprise SIEM instance. 

### Core Phases Execution

* **Network Boundary Segmentation & Zero-Trust Architecture** 

  * Implemented a multi-interface pfSense gateway to enforce strict isolation between production assets, DMZs, and remote offices.
  * Established an encrypted IPsec Site-to-Site VPN tunnel to securely route traffic from remote enclaves into the corporate backbone.
* **Offensive Security Assessments (Red Team)** 

  * **Reconnaissance:** Executed targeted Nmap discovery scans from the remote Kali Linux node (10.1.1.10) across the VPN to find open services inside the LAN.
  * **Exploitation & Lateral Movement:** Compromised unpatched application-layer services on the target LAN machine (192.168.60.131) and established pivoting routes to audit the isolated DMZ zone (10.3.3.10).
  * **Web Security Testing:** Used directory enumeration and traffic analysis to identify input parsing bugs and SQL Injection (SQLi) pathways on the corporate SAMAMTV web asset (192.168.60.50).
* **Defensive Security Analytics & Detection Engineering (Blue Team)** 

  * **Log Ingestion Pipeline:** Configured Splunk Universal Forwarders on endpoints to harvest Linux authentication records (linux_secure), web daemon streams (access_combined), and host shell histories (bash_history).
  * **Threat Detection Architecture:** Developed custom Splunk Processing Language (SPL) rules to trigger high-fidelity alerts for network port scanning baselines, active SSH brute-force handshakes, and SQL injection strings.

### 🛡️ Production Detection Engineering Snippets (Splunk SPL)

To validate the effectiveness of the telemetry pipeline, I engineered three high-fidelity alerting rules to isolate real-world threat vectors crossing the IPsec VPN tunnel from the remote node into the core network: 

### **Alert 1: Reconnaissance (Nmap Port Scan Detection)**

Monitors firewall traffic blocks to detect aggressive network enumeration hitting the web infrastructure. 

splunk

index=firewall_logs sourcetype=pfsense src_ip="10.1.1.10" dest_ip="192.168.60.50" action="blocked" OR action="rejected" 
| bucket _time span=1m 
| stats dc(dest_port) as unique_ports_scanned by _time, src_ip, dest_ip 
| where unique_ports_scanned > 20



### **Alert 2: Credential Stuffing (SSH Brute Force Detection)**

Tracks anomalous authentication failure rates on the target host to mitigate potential root-level access compromises. 

splunk

index=network_logs sourcetype=linux_secure src_ip="10.1.1.10" dest_ip="192.168.60.131" "Failed password" 
| stats count by src_ip, dest_ip, user 
| where count > 5

Use code with caution.

### **Alert 3: Web Exploitation (Directory Traversal / Command Injection)**

Scans web daemon access events for application-layer exploit strings targeting the corporate application layer. 

splunk

index=web_logs sourcetype=access_combined dest_ip="192.168.60.50" (status=404 OR status=403) AND (uri_path="etc/passwd" OR uri_path="cmd.exe" OR uri_path="bin/sh") 
| table _time, src_ip, uri_path, status


### 📂 Project 2 Assets

* 💻 **Source Code/Scripts:** View Splunk inputs.conf & savedsearches.conf

### 📩 Contact & Connect

* **Email:** kofiagyei79@gmail.com
* **GitHub:** [kofiagyei79](/url?sa=i&source=web&rct=j&url=https://github.com/kofiagyei79&ved=2ahUKEwi37JLEktWWAxVYEFkFHRU0Bl4Qg5wRegcIAAgSEMsB&opi=89978449&cd&psig=AOvVaw0Rc1cGgahDTy1ZyEtNjQMc&ust=1788618836091000)

© 2026 Kofi Agyei
