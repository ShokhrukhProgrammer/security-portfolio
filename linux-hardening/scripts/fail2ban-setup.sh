#!/bin/bash
apt update && apt install -y fail2ban

cat <<EOF > /etc/fail2ban/jail.local
[sshd]
enabled = true
port = ssh
logpath = %(sshd_log)s
backend = systemd
maxretry = 4
bantime = 1h
EOF

systemctl enable fail2ban
systemctl start fail2ban
