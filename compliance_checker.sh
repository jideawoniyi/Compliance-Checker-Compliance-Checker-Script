#!/bin/bash

# Extended Compliance Checker Script

# Define compliance benchmarks (example: required packages, services, etc.)
required_packages=("ufw" "fail2ban")
output_file="compliance_report_$(date +%Y%m%d).txt"

# Check system configurations
echo "Checking system compliance..." > $output_file
for pkg in "${required_packages[@]}"; do
    if dpkg-query -W -f='${Status}' $pkg 2>/dev/null | grep -q "install ok installed"; then
        echo "$pkg is installed." >> $output_file
    else
        echo "$pkg is NOT installed." >> $output_file
    fi
done

# Add checks for service statuses, file permissions, etc.

echo "Compliance check complete. Report saved in $output_file."
