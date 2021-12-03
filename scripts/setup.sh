#!/usr/bin/env sh

python -c "import os;gac = os.environ['SERVICE_ACCOUNT_KEY'];f = open('service_account.json','w');f.write(gac[1:-1]);f.close()"

gcloud config set project $PROJECT_ID
gcloud auth activate-service-account --key-file "service_account.json"