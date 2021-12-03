
## Google's Secrets Manager


At a minimum the following secrets need to be defined:

`SERVICE_ACCOUNT_KEY=<Service account for specific Google project>`

NOTE: If more secrets are added, the pubsub event function will need to be redeployed.


## Local environment files

There should be 2 environment files one for each Google project:

1. `.env_scl3`
2. `.env_hii`

And in each environment file the following variables should be defined:

```
SERVICE_ACCOUNT_KEY=<Service account for specific Google project>
```

## Deployments

When deploying to a specific Google Project, replace `[PREFIX]` with:

`hii`: HII Google Project (ex: `make hii_deploy_pubsub`)
`scl3`: SCL3 Google Project (ex: `make scl3_deploy_pubsub`)

**Deploy PubSub Topic:**

`make [PREFIX]_deploy_pubsub`

**Deploy PubSub Event Function:**

`make [PREFIX]_deploy_pubsub_function`

**Delete PubSub Topic:**

`make [PREFIX]_delete_pubsub`

**Delete PubSub Event Function:**

`make [PREFIX]_delete_pubsub_function`

**Run Sample Pipeline:**

`make [PREFIX]_publish_sample:`



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