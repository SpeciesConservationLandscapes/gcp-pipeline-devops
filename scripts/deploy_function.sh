#!/usr/bin/env bash

DEPLOYMENT_NAME="scl-create-vm-function"

CUR_DIR=`pwd` 
source "$CUR_DIR/scripts/setup.sh"

gcloud \
    alpha \
    functions deploy \
    create_vm \
    --source=$CUR_DIR/functions/create_orchestration_vm \
    --stage-bucket=pubsub_orchestration_vm \
    --runtime=python39 \
    --entry-point=pubsub_handler \
    --trigger-topic=scl-pipeline \
    --set-secrets=PROJECT_ID=PROJECT_ID:latest,SERVICE_ACCOUNT_KEY=SERVICE_ACCOUNT_KEY:latest
