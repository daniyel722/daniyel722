#!/bin/bash
# ==========================================
# Template: Create VPC, Subnet, and Firewall
# ==========================================

# --- 1. Variables (Edit these before running) ---
VPC_NAME="my-custom-vpc"
SUBNET_NAME="my-custom-subnet"
REGION="us-central1"
SUBNET_RANGE="10.0.0.0/24"
FIREWALL_RULE_NAME="allow-ssh-rdp-icmp"
NETWORK_TAGS="allow-admin" # Optional: apply firewall to specific VMs

# --- 2. Execution (Do not edit below) ---
echo "1. Creating Custom VPC Network: $VPC_NAME..."
gcloud compute networks create $VPC_NAME \
    --subnet-mode=custom

echo "2. Creating Subnet: $SUBNET_NAME in $REGION..."
gcloud compute networks subnets create $SUBNET_NAME \
    --network=$VPC_NAME \
    --region=$REGION \
    --range=$SUBNET_RANGE

echo "3. Creating Firewall Rule: $FIREWALL_RULE_NAME..."
gcloud compute firewall-rules create $FIREWALL_RULE_NAME \
    --network=$VPC_NAME \
    --allow=tcp:22,tcp:3389,icmp \
    --target-tags=$NETWORK_TAGS \
    --description="Allow SSH, RDP, and ICMP traffic"

echo "VPC, Subnet, and Firewall Creation Completed!"