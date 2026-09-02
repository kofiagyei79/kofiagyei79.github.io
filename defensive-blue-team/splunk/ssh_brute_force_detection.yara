rule linux_ssh_brute_force_detection {
  meta:
    author = "Kofi Okrah Agyei"
    description = "Detects anomalous SSH brute-force handshakes exceeding 5 authentication failures in a 1-minute window"
    severity = "High"
    mitre_attack_technique = "T1110 - Brute Force"

  events:
    // 1. Target security access validation logs
    $login.metadata.event_type = "USER_LOGIN"
    $login.metadata.product_name = "Linux Auth"
    
    // 2. Filter exclusively for failed authentication events
    $login.extensions.auth.auth_status = "FAILURE"
    
    // 3. Track target endpoints and connection elements
    $login.principal.ip = $attacker_ip
    $login.target.ip = $target_host_ip
    $login.target.user.userid = $targeted_username

  match:
    // Group identical attack trajectories together inside a 1-minute window
    $attacker_ip, $target_host_ip over 1m

  condition:
    // Alert if more than 5 distinct failure events are generated consecutively
    count($login.metadata.id) > 5
}
