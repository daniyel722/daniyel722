#!/bin/bash
# ==========================================
# Template: Create GKE (Kubernetes) Cluster
# ==========================================

# --- 1. Variables (Edit these before running) ---
CLUSTER_NAME="my-cluster"
ZONE="us-central1-a"
NUM_NODES=3
MACHINE_TYPE="e2-medium"

# --- 2. Execution (Do not edit below) ---
echo "Creating GKE Cluster: $CLUSTER_NAME in zone $ZONE with $NUM_NODES nodes..."

gcloud container clusters create $CLUSTER_NAME \
    --zone=$ZONE \
    --num-nodes=$NUM_NODES \
    --machine-type=$MACHINE_TYPE

echo "Fetching cluster credentials..."
gcloud container clusters get-credentials $CLUSTER_NAME --zone=$ZONE

echo "GKE Cluster Creation and Credential Fetching Completed!"