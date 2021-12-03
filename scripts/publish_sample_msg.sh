#!/usr/bin/env bash

PUBSUB_TOPIC="task-pipeline"
source "/app/scripts/setup.sh"

gcloud pubsub topics publish $PUBSUB_TOPIC --message "$(cat pipeline_sample.json | jq -c)"


