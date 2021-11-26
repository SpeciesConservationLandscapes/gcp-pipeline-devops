#!/usr/bin/env bash

DEPLOYMENT_NAME="scl-create-vm-function"

CUR_DIR=`pwd` 
source "$CUR_DIR/scripts/setup.sh"

gcloud alpha functions delete create_vm