#!/bin/bash
# ==========================================
# Template: Create HTTP Load Balancer
# ==========================================

# --- 1. Variables (Edit these before running) ---
PORT="80"
ZONE="us-central1-a"
INSTANCE_GROUP="web-instance-group"       # Name instance group you before created wirte
HEALTH_CHECK_NAME="http-health-check"
BACKEND_SERVICE_NAME="web-backend-service"
URL_MAP_NAME="web-map"
TARGET_PROXY_NAME="http-lb-proxy"
FORWARDING_RULE_NAME="http-content-rule"

# --- 2. Execution (Do not edit below) ---
echo "1. Creating Health Check..."
gcloud compute health-checks create http $HEALTH_CHECK_NAME \
    --port=$PORT

echo "2. Creating Backend Service..."
gcloud compute backend-services create $BACKEND_SERVICE_NAME \
    --protocol=HTTP \
    --port-name=http \
    --health-checks=$HEALTH_CHECK_NAME \
    --global

echo "3. Adding Instance Group to Backend Service..."
gcloud compute backend-services add-backend $BACKEND_SERVICE_NAME \
    --instance-group=$INSTANCE_GROUP \
    --instance-group-zone=$ZONE \
    --global

echo "4. Creating URL Map..."
gcloud compute url-maps create $URL_MAP_NAME \
    --default-service=$BACKEND_SERVICE_NAME

echo "5. Creating Target HTTP Proxy..."
gcloud compute target-http-proxies create $TARGET_PROXY_NAME \
    --url-map=$URL_MAP_NAME

echo "6. Creating Forwarding Rule..."
gcloud compute forwarding-rules create $FORWARDING_RULE_NAME \
    --global \
    --target-http-proxy=$TARGET_PROXY_NAME \
    --ports=$PORT

echo "HTTP Load Balancer Creation Completed!"