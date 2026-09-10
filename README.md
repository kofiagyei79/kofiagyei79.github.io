# Kofi Okrah Agyei 🚀
### Cybersecurity Analyst | Pentester | SIEM & Detection Engineer 

Welcome to my central engineering and security validation repository. This portfolio bridges **healthcare data compliance (HIPAA/PHI) frameworks** with practical threat-hunting pipelines, enterprise cyber ranges, and production-grade SIEM engineering blueprints.

🌐 **Live Portfolio Website:** [kofiagyei79.github.io](https://kofiagyei79.github.io)  
💼 **LinkedIn Profile:** [://linkedin.com](https://www.linkedin.com)

---

## 🛠️ Technical Security Competencies & Tools
* **SIEM & Analytics:** Splunk Enterprise (SPL Engineering), Google SecOps (YARA-L Development)
* **Endpoint & Threat Intel:** SentinelOne Deep Visibility, Wiz Cloud Security
* **Network & Perimeter Defense:** pfSense Firewall Routing, Site-to-Site IPsec VPN Tunnels
* **Offensive Security Labs:** Nmap, Wireshark, Metasploit Framework, EVE-NG Architecture
* **Frameworks & Compliance:** HIPAA Patient Data Security, Access Control Matrices, SOC 2 Implementer

---

## 🚀 Project 1: Black Box Penetration Testing Simulation (Capstone)

### 📋 Project Overview
This project simulated a real-world adversarial attack against a blind "black box" host system to locate critical vulnerabilities, execute lateral environment movement, and test sandbox boundary escape mechanisms. The final phase transitions these offensive vectors into a **Purple Team** telemetry baseline to feed detection data pipelines.

```text
+--------------------+      Active Nmap & Metasploit Vectors      +----------------------+

| Remote Attack Node | ========================================> | Confined target Host |
|   (Kali Linux)     | <======================================== |    (rbash Sandbox)   |
+--------------------+        Interactive Reverse Payload        +----------------------+
                                                                             ||
                                                                      Syslog Forwarding
                                                                      (Port 514 Splunk)
                                                                             ||
                                                                             \/
                                                                  +----------------------+

                                                                  | Central SIEM Target  |
                                                                  +----------------------+
```

### ⚙️ Core Engagement Phases
1. **Reconnaissance & Scan:** Exploited active discovery arrays using Nmap engine triggers (`-sV`, `-O`) to enumerate hidden network hooks.
2. **Credential Extraction:** Abused unauthenticated local guest SMB directories to recover cleartext configurations (`deets.txt`).
3. **Reverse Control Chain:** Dropped interactive reverse payloads by binding Metasploit handlers inside vulnerable web management dependencies.
4. **Sandbox Isolation Escape:** Cleanly broke out of restricted local shells (`rbash`) using dynamic runtime library code injections.
5. **Defensive Telemetry Ingestion:** Constructed a logging pipeline forwarding host operating system events and raw auth syslogs to a central logging collector over port 514 to map traffic spikes and process anomalies.

📦 **Project 1 Assets:** 
* 📥 [Download Capstone Presentation](./Presentation1Black%20Box%20system%20testing.pptx)
* 📄 [View Formal Engineering Report](./Cybersecurity_Capstone_Engineering_Report.pdf)

---

## 🚀 Project 2: Enterprise Hybrid Lab & Splunk SIEM Engineering

### 📋 Project Overview
Designed and deployed a secure multi-subnet network architecture inside **EVE-NG** integrated into an AWS Cloud framework. The primary goal was to route live offensive exploitation traffic across encrypted paths and build custom **Splunk SIEM** dashboards to track malicious operations.

![Enterprise Lab Network Topology](./network-topology.png)

### ⚙️ Core Engineering Components
* **Zero-Trust Boundary Segmentation:** Deployed a multi-interface pfSense firewall gateway to isolate Attack Enclaves, Corporate LAN segments, and DMZs.
* **Encrypted Data Pipelines:** Established an encrypted Site-to-Site IPsec VPN tunnel to route logging telemetry securely from the remote endpoints into the core Splunk deployment.
* **Data Harvest Pipelines:** Configured Splunk Universal Forwarders across endpoints to harvest Linux authentication records (`linux_secure`), web daemon streams (`access_combined`), and host shell histories (`bash_history`).

### 🛡️ Production Detection Engineering Snippets (Splunk SPL)

#### Alert 1: Reconnaissance (Nmap Port Scan Detection)
*Tracks aggressive network firewall blocks to catch scanning vectors targeting web nodes over the VPN.*
```splunk
index=firewall_logs sourcetype=pfsense src_ip="10.1.1.10" dest_ip="192.168.60.50" action="blocked" OR action="rejected" 
| bucket _time span=1m 
| stats dc(dest_port) as unique_ports_scanned by _time, src_ip, dest_ip 
| where unique_ports_scanned > 20
```

#### Alert 2: Credential Stuffing (SSH Brute Force Detection)
*Monitors anomalous authentication failure counts within narrow intervals to prevent unauthorized host compromise.*
```splunk
index=network_logs sourcetype=linux_secure src_ip="10.1.1.10" dest_ip="192.168.60.131" "Failed password" 
| stats count by src_ip, dest_ip, user 
| where count > 5
```

#### Alert 3: Web Exploitation (Directory Traversal / Command Injection)
*Scans web application access streams for application-layer exploit strings attempting directory break-outs.*
```splunk
index=web_logs sourcetype=access_combined dest_ip="192.168.60.50" (status=404 OR status=403) AND (uri_path="etc/passwd" OR uri_path="cmd.exe" OR uri_path="bin/sh") 
| table _time, src_ip, uri_path, status
```

📦 **Project 2 Assets:**
* 📥 [Download Hybrid Lab PPTX](./Presentation2Enterprise%20Hybrid%20Lab.pptx)
* ⚙️ [View Splunk Input Configurations](./defensive-blue-team/splunk/)

## 🧪 Detection Engineering & Rule Verification Framework

To ensure the custom Splunk SPL search directives and Google SecOps YARA-L rules operate with high precision and zero false-negative failure rates, all detection logic was rigorously tested inside my enterprise-grade EVE-NG cyber range virtual infrastructure. 

+------------------+                    +--------------------+|    Kali Linux    | --[Attacks IP]-->  | Ubuntu Target Host || (10.1.1.10 Node) |                    | (192.168.60.131)   |+------------------+                    +--------------------+|                                         |+-----------> [ Routed Through ] <--------+|/+--------------------+|  pfSense Firewall  ||  (Multi-Interface) |+--------------------+|[ Syslog 514 ]/+--------------------+|   Splunk SIEM /    ||   Google SecOps    |+--------------------+
### ⚙️ The Attack Simulation Pipeline
The verification process was executed through a structured, multi-stage attack lifecycle to match real-world threat actor maneuvers:

1. **Reconnaissance Spikes:** Initiated aggressive scanning profiles from the remote attack enclave (`10.1.1.10`) using target enumeration triggers (`nmap -p- -sV -T4 192.168.60.50`). The target multi-interface pfSense firewall successfully blocked unauthorized ports, logging the drops instantly to the perimeter index pool.
2. **Credential Brute-Forcing:** Deployed automated credential attack matrices (`hydra -l root -P rockyou.txt ssh://192.168.60.131`) to force persistent authentication failures within short-duration time windows.
3. **Data Staging & Archival Manipulation:** Once local access was established on a low-privilege service account, I executed mass read lookups across flat mock database files, bundling the staged output using native command-line data archiving strings (`tar -czf clinical_dump.tar.gz /var/log/clinical_records/`).

---

### 🔍 Alert Logic Ingestion & Rule Validation Metrics

#### 1. Splunk SPL Verification
* **Trigger Event:** The brute-force matrix triggered massive spikes of `Failed password` authentication lines within the host system log `linux_secure` stream.
* **Telemetry Analysis:** The `viz_auth_failures_over_time` line chart on the real-time Splunk Dashboard Studio layout successfully captured the operational anomaly. The rule accurately filtered out low-volume systemic noise, escalating the alert immediately when distinct user targets exceeded a value threshold of 5 failures within a single 60-second span.

#### 2. Google SecOps YARA-L Verification
* **Trigger Event:** The deployment of the archiving engine sequence triggered a local `PROCESS_LAUNCH` kernel event line tracking back to user shell parameters.
* **Telemetry Analysis:** The multi-stage conditional query engine verified that the source account matched the database extract footprint. Because the event volume flag `#read > 50` successfully linked back to the target execution string, the rule immediately triggered a `Critical` severity indicator block on the console dashboard, preventing blind spots during data exfiltration phases.

---

### 💡 Engineering Key Takeaways
* **Zero Leak Execution:** Network segmentation managed by the pfSense gateway successfully restricted raw lateral movement, forcing the traffic through designated security observation channels.
* **High-Fidelity Tuning:** By shifting the detection focus away from basic singu

## 🚀 Project 3: Zero Trust Perimeter Architecture (In Progress)
rule ehr_lateral_access_hunting {
  meta:
    author = "Kofi Okrah Agyei"
    description = "Detects anomalous lateral access attempts across multiple patient care data segments using a single compromised credential matrix."
    severity = "High"
    regulatory_mapping = "HIPAA Security Rule § 164.312(a)(1) - Access Control"

  events:
    $auth.metadata.event_type = "USER_LOGIN"
    $auth.principal.user.userid = $user
    $auth.target.asset.ip = $target_ip
    
    // Filters for healthcare network segments mapped in pfSense enclaves
    $auth.target.resource.name = /.*ehr_system.*/ or $auth.target.resource.sub_domain = "clinical-phi"
    $auth.metadata.vendor_name = "UMass_Memorial_EHR_Gateway"
    $auth.security_result.action = "ALLOW"

  match:
    $user over 5m

  condition:
    #target_ip > 3
}

Designing an identity-centric network perimeter defense plan utilizing micro-segmentation models. This setup enforces absolute least-privilege resource validation schemas to prevent lateral internal transitions across multi-tenant infrastructures.

⏳ **Current Phase:** *Architecture Design & YARA-L Policy Mapping*


© 2026 Kofi Okrah Agyei. All rights reserved.
