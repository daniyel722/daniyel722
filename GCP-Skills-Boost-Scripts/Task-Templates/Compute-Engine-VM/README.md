\[🇮🇷 \*\*فارسی\*\*](README-fa.md) | \[🇺🇸 \*\*English\*\*](README.md)



\# 🖥️ Compute Engine VM Creation Template



This template provides a parameterized Bash script to quickly deploy a Google Compute Engine Virtual Machine (VM) using the Google Cloud CLI (`gcloud`) in Cloud Shell.



\## ⚙️ Configuration Variables

Before running the script, modify the variables at the top of the `create-vm-template.sh` file according to your lab or scenario requirements:



\* \*\*`INSTANCE\_NAME`\*\*: The name of your virtual machine.

\* \*\*`ZONE`\*\*: The GCP zone (e.g., `us-central1-a`).

\* \*\*`MACHINE\_TYPE`\*\*: The compute capacity (e.g., `e2-micro` for basic tasks).

\* \*\*`TAGS`\*\*: Network tags to apply firewall rules (e.g., `http-server`).

\* \*\*`--no-address`\*\*: This flag is included by default to prevent assigning a public IP (useful for Bastion hosts). Remove this line if your VM needs external internet access.



\## 🚀 Usage in Cloud Shell



1\. Create a new file and paste the script:

&#x20;  ```bash

&#x20;  nano create-vm-template.sh

## 🚀 Usage in Cloud Shell

1. Make the script executable:
   ```bash
   chmod +x create-vm-template.sh
2\. Run the script 

./create-vm-template.sh 

