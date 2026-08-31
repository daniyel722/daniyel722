#!/bin/bash
# ==========================================
# Template: Create Compute Engine VM Instance
# ==========================================

# --- 1. Variables (Edit these before running) ---
INSTANCE_NAME="web-server-01"
ZONE="us-central1-a"
MACHINE_TYPE="e2-micro"
NETWORK="default"
SUBNET="default"
TAGS="http-server,https-server"

# --- 2. Execution (Do not edit below) ---
echo "Creating VM Instance: $INSTANCE_NAME in zone $ZONE ..."

gcloud compute instances create $INSTANCE_NAME \
    --zone=$ZONE \
    --machine-type=$MACHINE_TYPE \
    --network=$NETWORK \
    --subnet=$SUBNET \
    --tags=$TAGS \
    --image-family=debian-11 \
    --image-project=debian-cloud \
    --no-address

echo "VM Creation Completed!"