#!/bin/bash
apt update && apt install -y auditd audispd-plugins

systemctl enable auditd
systemctl start auditd

echo "-w /etc/passwd -p wa -k passwd_changes" >> /etc/audit/rules.d/audit.rules
echo "-w /etc/shadow -p wa -k shadow_changes" >> /etc/audit/rules.d/audit.rules
