rule pfsense_network_port_scan_detection {
  meta:
    author = "Kofi Okrah Agyei"
    description = "Detects aggressive Nmap port scans exceeding 20 unique ports per minute crossing pfSense boundaries"
    severity = "Medium"
    mitre_attack_technique = "T1046 - Network Service Discovery"

  events:
    // 1. Identify network connection logs originating from the remote attack node
    $net.metadata.event_type = "NETWORK_CONNECTION"
    $net.metadata.product_name = "pfSense"
    
    // 2. Isolate security drops and rejections 
    ($net.security_result.action = "BLOCK" or $net.security_result.action = "REJECT")
    
    // 3. Bind variables to correlate logs together
    $net.principal.ip = $attacker_ip
    $net.target.ip = $target_corporate_ip
    $net.target.port = $scanned_port

  match:
    // Group matching logs by Attacker and Target IPs within a 1-minute window
    $attacker_ip, $target_corporate_ip over 1m

  condition:
    // Trigger a high-priority alert if the distinct target port count exceeds 20
    count_distinct($scanned_port) > 20
}
