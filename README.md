# ⚔️ Enterprise Security Architecture & Compliance Validation
### 📑 Case Study: Contract #1 Execution for Okagyeson LLC
**Target Assessment Perimeter:** `https://okagyeson.org`  
**Security Operations Engineering Team:** Okagyeson Cyber Defense LLC  
**Lead Systems Security Engineer:** Kofi Okrah Agyei  

---

## 🎯 Executive Project Overview
This repository contains the complete production configuration frameworks, network maps, and vulnerability triage documentation generated during the deployment of an enterprise-grade Security Operations Center (SOC) telemetry pipeline. 

### The Enterprise Challenge
The client required an immediate, comprehensive validation of their external perimeter routing, unified security analytics ingestion, and formal alignment with regulatory compliance metrics to safeguard operational workflows without introducing infrastructure downtime.

### The Defensive Solution
Our engineering team designed a synchronized multi-node infrastructure:
1. **Offensive Surface Inspection:** Mapping the perimeter attack landscape to discover unshielded protocols, proxy behavior, and input boundaries.
2. **EDR Endpoint Telemetry:** Deploying decentralized Wazuh Agents to stream host-level audit traits and console histories directly into the detection engines.
3. **SIEM Data Aggregation:** Orchestrating a centralized data ingestion loop within Splunk Enterprise to analyze system telemetry in real time.

---

## 🗺️ System Topology & Data Flow Diagram

```text
  [ Kali Attack Machine ] ──────────(Active Verification)──────────> [ www.okagyeson.org ]
             │                                                                │
     (Terminal Audits)                                              (Cloudflare Reverse Proxy)
             ▼                                                                ▼
    [ Wazuh EDR Agent ] ───────────(Encrypted Ports 1514/1515)──────────> [ Wazuh Manager ]
                                                                              │
                                                                   (JSON Log Ingestion Forward)
                                                                              ▼
                                                                      [ Splunk SIEM ]
```

---

## 🛠️ Production Configuration Blueprints

### 1. Endpoint Log Collector (`ossec.conf`)
Configured locally on the operations environment to hook standard shell command execution histories directly into the security daemon data streams:
```xml
  <localfile>
    <log_format>syslog</log_format>
    <location>/home/agyei/.bash_history</location>
  </localfile>
</ossec_config>
```

### 2. SIEM Telemetry Analytics (Splunk SPL)
The core query syntax used to parse, isolate, and visualize endpoint activity trends within the centralized security dashboard:
```spl
index=security "kali-agent-02"
```

### 3. Wazuh Custom Manager Rules (`local_rules.xml`)
Custom XML exception logic injected into the central manager to handle baseline signature mismatches, effectively silencing Level 7 system check false positives while keeping the master rule container intact:
```xml
<group name="local,">
  <rule id="100051" level="0">
    <if_sid>510</if_sid>
    <match>/usr/bin/diff|/usr/bin/dir</match>
    <description>Ignore false positive trojan warnings for verified system binaries.</description>
  </rule>
</group>
```

---

## 📑 Executive Cybersecurity Assessment Report

### 1. Perimeter Scanning Matrix (Offensive Discovery)
* **Infrastructure Discovery:** The target framework operates over a Cloudflare proxy tier, passing unencrypted HTTP requests through hard `302 Found` redirection policies to enforce secure HTTPS transmission lines.
* **Backend Asset Fingerprint:** The underlying site routing interfaces directly with the Yola Site Builder ecosystem (`*.yolasite.com`) backed by a Varnish cache engine proxy layer.
* **Attack Surface Boundary:** Critical management layers (SSH, FTP, MySQL) are securely filtered by network-level Access Control Lists (ACLs). 

### 2. Vulnerability Backlog
* **Missing HTTP Security Standards:** The application delivery tier completely lacks active security boundaries, including a **Content Security Policy (CSP)**, **Strict-Transport-Security (HSTS)**, and **X-Frame-Options** headers.
* **Risk Profile:** The unshielded Varnish cache platform leaves the frontend layer susceptible to potential Web Cache Deception patterns if input fields or file upload modules are mutated.

### 3. Engineering Recommendations (Remediation Patch)
To secure the application against these structural framework gaps, the client must apply the following secure header enforcement policies within their production reverse proxies:
```nginx
# Production Hardening Matrix
add_header Content-Security-Policy "default-src 'self'; script-src 'self'; style-src 'self' 'unsafe-inline'; frame-ancestors 'none'; object-src 'none';" always;
add_header Strict-Transport-Security "max-age=63072000; includeSubDomains; preload" always;
add_header X-Frame-Options "DENY" always;
add_header X-Content-Type-Options "nosniff" always;
```

---

## 📊 Enterprise Regulatory Compliance Matrix

Our technical architecture maps directly to the required security controls of global audit standards:

| Implemented Architecture | Technical Auditing Mechanism | Regulatory Compliance Mapping |
| :--- | :--- | :--- |
| **Wazuh EDR Heartbeat Integration** | Streamed continuous process loops, tracked administrative privilege elevation triggers (`sudo`), and verified host-level configuration states. | **HIPAA Security Rule § 164.312(b)** (Audit Controls)<br>**ISO 27001 Control A.12.4.1** (Event Logging) |
| **Splunk SIEM Data Pipeline** | Centralized separate agent datasets into a secure, searchable log storage interface for real-time risk assessment. | **SOC 2 Type II CC7.2** (Security Monitoring)<br>**ISO 27001 Control A.12.4.3** (Admin Logs) |
| **Custom XML Rule Optimization** | Tuned out false-positive alarm noise to guarantee high-severity security notifications are prioritized within the operations center. | **SOC 2 Type II CC7.1** (Operational Controls)<br>**HIPAA Security Rule § 164.308(a)(1)** (Risk Management) |

---
