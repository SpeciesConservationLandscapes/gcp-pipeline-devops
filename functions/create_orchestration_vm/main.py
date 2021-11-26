import base64
import json
import logging
import os
import uuid

import googleapiclient.discovery
from jinja2 import Template


DEFAULT_VM_CONFIG = {
    "vm-size": "e2-micro",
    "disk-size-gb": 10,
    "zone": "us-central1-f"
}


def json_escape(tasks):
    return json.dumps(json.dumps(tasks))


def _get_startup_script_content():
    with open("boot.sh", "r") as f:
        return f.read()


def _get_target_config_content(deploy_name, vm, tasks):
    with open("scl-orchestration-vm.jinja", "r") as f:
        template = Template(f.read())
        return template.render(
            env={
                "project": os.environ["PROJECT_ID"],
                "service_account_key": os.environ["SERVICE_ACCOUNT_KEY"],
            },
            deploy_name=deploy_name,
            vm=vm,
            tasks=json_escape(tasks),
            startup_script=_get_startup_script_content(),
        )


def read_pipeline_config(config):
    config = config or {}
    tasks = config.get("tasks")
    vm = {}
    vm.update(DEFAULT_VM_CONFIG)
    vm.update(config.get("vm") or {})
    return vm, tasks


def _get_name():
    return f"pipeline-{uuid.uuid4()}"


def deploy_vm(deploy_name, vm, tasks):
    content = _get_target_config_content(deploy_name, vm, tasks)
    req = {
        "name": deploy_name,
        "target": {
            "config": {
                "content": content,
            }
        }
    }

    deploy_manager = googleapiclient.discovery.build("deploymentmanager", "v2")
    return (deploy_manager.deployments()
        .insert(project=os.environ["PROJECT_ID"], body=req)
        .execute()
    )

def pubsub_handler(event, context):
    message = base64.b64decode(event["data"]).decode("utf-8")
    pipeline_config = json.loads(message)
    vm, tasks = read_pipeline_config(pipeline_config)
    if not tasks:
        logging.warning("No tasks")
        return
    
    deploy_name = _get_name()
    deploy_vm(deploy_name, vm, tasks)


if __name__ == "__main__":
    pubsub_handler(None, None)
