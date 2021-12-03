# apt update
apt-get install -y curl git python3 python3-pip

# Install google logging agent
curl -sSO https://dl.google.com/cloudagents/add-logging-agent-repo.sh
bash add-logging-agent-repo.sh --also-install

# Install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh ./get-docker.sh

# Fetch and setup Task orchestration code
git clone -b develop --single-branch https://github.com/SpeciesConservationLandscapes/task_orchestration.git
cd task_orchestration
python3 -m pip install -r requirements.txt

# Run pipeline
echo $TASKS > tasks.json
python3 src/task.py --pipeline_file="tasks.json" --exit_on_error

# Tear down VM
echo $SERVICE_ACCOUNT_KEY > service_account.json
gcloud config set project $PROJECT_ID
gcloud auth activate-service-account --key-file "service_account.json"
gcloud deployment-manager deployments delete -q $DEPLOY_NAME