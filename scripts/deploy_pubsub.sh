#!/usr/bin/env bash

DEPLOYMENT_NAME="scl-pipeline-pubsub"

source "/scripts/setup.sh"

gcloud deployment-manager deployments create $DEPLOYMENT_NAME --template /templates/scl-pipeline-pubsub.jinja