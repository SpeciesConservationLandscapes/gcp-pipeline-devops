#!/usr/bin/env bash

DEPLOYMENT_NAME="pipeline-pubsub"

source "/app/scripts/setup.sh"

gcloud deployment-manager deployments delete -q $DEPLOYMENT_NAME