

## Pipeline Schema


```
{
    "vm": {
        "machine-type": string (defaults: "e2-micro"),
        "disk-size-gb": integer (defaults: 10),
        "zone": string (defaults: "us-central1-f")
    },
    "tasks": [
        [
            {
                "image": string,
                "cmd": string,
                "args": object
            }
        ]
    ]
}
```


## Secret Manager

Need to define the following secrets in Google's Secret Manager:

```
PROJECT_ID=
SERVICE_ACCOUNT_KEY=
```

## Deployments

**Deploy PubSub Topic:**

`make deploy_pubsub`

**Deploy PubSub Event Function:**

`make deploy_pubsub_function`

**Delete PubSub Topic:**

`make delete_pubsub`

**Delete PubSub Event Function:**

`make delete_pubsub_function`
