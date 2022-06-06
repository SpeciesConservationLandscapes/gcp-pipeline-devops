FROM python:3.9-slim-bullseye

RUN apt-get update && apt-get install -y apt-transport-https ca-certificates gnupg curl jq
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

ENV CLOUDSDK_PYTHON=/usr/local/bin/python
RUN apt-get update &&  apt-get install -y google-cloud-sdk

RUN mkdir -p /app
WORKDIR /app