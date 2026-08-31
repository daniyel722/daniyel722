\[🇮🇷 \*\*فارسی\*\*](README-fa.md) | \[🇺🇸 \*\*English\*\*](README.md)



\# ⚖️ HTTP Load Balancer Creation Template



This template provides an automated Bash script to configure and deploy a Global HTTP Load Balancer in Google Cloud using the `gcloud` CLI.



\## ⚙️ Configuration Variables

Before running the script, ensure you have an existing \*\*Instance Group\*\* (managed or unmanaged). Edit the variables at the top of the `create-lb-template.sh` file:



\* \*\*`INSTANCE\_GROUP`\*\*: The exact name of your backend instance group.

\* \*\*`ZONE`\*\*: The zone where your instance group is located.

\* \*\*`PORT`\*\*: The traffic port (usually `80` for HTTP).

\* The rest of the variables (like `URL\_MAP\_NAME`, `TARGET\_PROXY\_NAME`) can be left as default unless your specific lab requires exact naming conventions.



\## 🚀 Usage in Cloud Shell



1\. Make the script executable:

&#x20;  ```bash

&#x20;  chmod +x create-lb-template.sh

Run the script



./create-lb-template.sh

