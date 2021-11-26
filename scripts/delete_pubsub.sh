#!/usr/bin/env bash

DEPLOYMENT_NAME="scl-pipeline-pubsub"

source "/scripts/setup.sh"

gcloud deployment-manager deployments delete -q $DEPLOYMENT_NAME