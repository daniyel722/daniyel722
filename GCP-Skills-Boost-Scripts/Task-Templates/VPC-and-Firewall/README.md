\[🇮🇷 \*\*فارسی\*\*](README-fa.md) | \[🇺🇸 \*\*English\*\*](README.md)



\# 🌐 VPC \& Firewall Creation Template



This template provides an automated Bash script to set up a Custom Virtual Private Cloud (VPC), a Subnet, and basic Firewall rules in Google Cloud using the `gcloud` CLI.



\## ⚙️ Configuration Variables

Before running the script, modify the variables at the top of the `create-vpc-firewall-template.sh` file according to your lab or scenario:



\* \*\*`VPC\_NAME`\*\*: The name of your custom VPC network.

\* \*\*`SUBNET\_NAME`\*\*: The name of your subnet.

\* \*\*`REGION`\*\*: The GCP region for your subnet (e.g., `us-central1`).

\* \*\*`SUBNET\_RANGE`\*\*: The CIDR block for your subnet (e.g., `10.0.0.0/24`).

\* \*\*`FIREWALL\_RULE\_NAME`\*\*: The name of the firewall rule.

\* \*\*`NETWORK\_TAGS`\*\*: (Optional) Target tags to apply this firewall rule only to specific VMs (e.g., `allow-admin`). 



\*Note: The script currently allows TCP ports 22 (SSH), 3389 (RDP), and ICMP (Ping). You can modify the `--allow` flag in the script if you need different ports (like TCP 80 for HTTP).\*



\## 🚀 Usage in Cloud Shell



1\. Make the script executable:

&#x20;  ```bash

&#x20;  chmod +x create-vpc-firewall-template.sh



Run the script:



./create-vpc-firewall-template.sh



