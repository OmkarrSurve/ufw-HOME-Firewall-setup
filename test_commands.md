UFW Firewall Testing Guide

This file outlines how to test the UFW firewall setup to ensure it allows SSH (22), HTTP (80), and HTTPS (443) while blocking other traffic.

Prerequisites



Install tools: -> sudo apt install nmap netcat-traditional



Ensure a service is running (e.g., Apache for HTTP/HTTPS: sudo apt install apache2 && sudo systemctl start apache2)

Test Allowed Ports

Verify connections to allowed ports succeed:

-> nc -v localhost 22  # SSH: Should connect if sshd is running

-> nc -v localhost 80  # HTTP: Should connect if Apache is running

-> nc -v localhost 443  # HTTPS: Should connect if SSL is configured


Test Denied Ports

Ensure blocked ports time out:

-> nc -v localhost 1234  # Should time out (default deny)


Scan with Nmap

Check open vs. filtered ports:

-> sudo nmap -p 1-1000 localhost


Expected: 22, 80, 443 "open" (if services run) or "closed"; others "filtered".

