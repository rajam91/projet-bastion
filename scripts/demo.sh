#!/bin/zsh
echo "=== Bastion project: starting the demo ==="
for vm in Server-AD Bastion SRV-WEB user; do
  VBoxManage startvm "$vm" --type headless >/dev/null 2>&1 && echo "  [$vm] started"
done
echo "Waiting for Guacamole (may take ~1 min on 8 GB)..."
code=000
for i in $(seq 1 60); do
  code=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8080/guacamole/ --max-time 3)
  [ "$code" = "200" ] && break
  sleep 3
done
echo ""
echo "================= DEMO READY ================="
echo "  Web UI    : http://localhost:8080/guacamole/   (HTTP $code)"
echo "  Admin     : guacadmin / CHANGE_ME_ADMIN"
echo "  Domain    : utilisateur | dev | admin   (password CHANGE_ME)"
echo "  MFA code  : run   ~/bastion-totp.sh"
echo "=============================================="
