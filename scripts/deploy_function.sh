#!/usr/bin/env bash

DEPLOYMENT_NAME="create-vm-function"

source "/app/scripts/setup.sh"

secrets=""
for name in `gcloud secrets list --format="value(name)"`; do
  secrets="$secrets$name=$name:latest,"
done

gcloud \
    alpha \
    functions deploy \
    create_vm \
    --source=/app/functions/create_orchestration_vm \
    --stage-bucket=pubsub_orchestration_vm-$PROJECT_ID \
    --runtime=python39 \
    --entry-point=pubsub_handler \
    --trigger-topic=task-pipeline \
    --set-secrets=$secrets
