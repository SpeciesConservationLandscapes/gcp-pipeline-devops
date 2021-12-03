#!/usr/bin/env bash

DEPLOYMENT_NAME="create-vm-function"

source "/app/scripts/setup.sh"

gcloud alpha functions delete -q create_vm