

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