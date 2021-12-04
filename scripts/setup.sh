#!/usr/bin/env sh

python -c "import os;gac = os.environ['SERVICE_ACCOUNT_KEY'];f = open('service_account.json','w');f.write(gac);f.close()"
PROJECT_ID=`python -c "import json,os;print(json.loads(os.environ['SERVICE_ACCOUNT_KEY'])['project_id'])"`

gcloud config set project $PROJECT_ID
gcloud auth activate-service-account --key-file "service_account.json"