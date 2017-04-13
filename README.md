# Docker Container for Google PubSub emulator

Based on: https://github.com/SaMnCo/docker-pubsub-emulator

The gcloud suite has an emulator for Google PubSub, which is great for testing locally how to run code against their APIs. 

However, it is not very useful if you want to run in a containerized environment, and want to test how the whole thing behaves. Hence this container. 

TODO:

  1. Rename this to gcloud tool
  2. Generalize this to instantiate any of the gcloud emulators

# How to use for Docker

```
$ docker pull legalio/pubsub-emulator:20170413
$ docker run -it --name pubsub-emulator -p 8538:8538 legalio/pubsub-emulator:20170413
```

Now you need to run the equivalent of the ```$(gcloud beta emulators pubsub env-init)``` command

```
$ export PUBSUB_EMULATOR_HOST=localhost:8538
```

Now you can use the standard APIs such as [gcloud-python](https://github.com/googlecloudplatform/gcloud-python) to interact with it. 

# ENV VARIABLES / TWEAKS
## Data Store

You can bind a volume to /data in the container to get resilient data.

```
$ docker run -it --name pubsub-emulator -p 8042:8042 -v /path/to/my/data/folder:/data legalio/pubsub-emulator:20170413
```

## Port

You can also change the port where the emulator runs by editing the HOST_PORT environment variable. 

## Logs

The emulator logs are stored in /var/log/pubsub.log

@TODO Push to stdout to make this easier for debugging
@TODO Get rid of Phusion baseimage, use dinit to start




