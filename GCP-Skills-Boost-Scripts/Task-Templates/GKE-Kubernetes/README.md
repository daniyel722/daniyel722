\[🇮🇷 \*\*فارسی\*\*](README-fa.md) | \[🇺🇸 \*\*English\*\*](README.md)



\# ☸️ GKE (Kubernetes) Cluster Creation Template



This template provides a parameterized Bash script to rapidly deploy a Google Kubernetes Engine (GKE) cluster using the `gcloud` CLI in Cloud Shell.



\## ⚙️ Configuration Variables

Before running the script, modify the variables at the top of the `create-gke-template.sh` file according to your lab or challenge requirements:



\* \*\*`CLUSTER\_NAME`\*\*: The name of your Kubernetes cluster.

\* \*\*`ZONE`\*\*: The GCP zone where the cluster will be deployed (e.g., `us-central1-a`).

\* \*\*`NUM\_NODES`\*\*: The number of nodes (virtual machines) in the cluster pool.

\* \*\*`MACHINE\_TYPE`\*\*: The VM type for the worker nodes (e.g., `e2-medium`).



\*Note: The script automatically fetches the cluster credentials using `get-credentials` so you can immediately start using `kubectl` commands.\*



\## 🚀 Usage in Cloud Shell



1\. Make the script executable:

&#x20;  ```bash

&#x20;  chmod +x create-gke-template.sh



Run the script

&#x20;./create-gke-template.sh

