#!/usr/bin/env bash

DEPLOYMENT_NAME="scl-pipeline-pubsub"

source "/app/scripts/setup.sh"

gcloud deployment-manager deployments create $DEPLOYMENT_NAME --template /app/templates/scl-pipeline-pubsub.jinja