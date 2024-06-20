#!/bin/bash

# Check if a release tag was provided as a command-line argument
if [ $# -eq 0 ]; then
  echo "No release tag provided. Usage: $0 RELEASE_TAG"
  exit 1
fi

RELEASE_TAG=$1

python build.py \
--enable-logging \
--enable-stats \
--enable-tracing \
--enable-metrics \
--no-container-interactive \
--endpoint=http \
--endpoint=grpc \
--endpoint=sagemaker \
--repo-tag=common:$RELEASE_TAG \
--repo-tag=core:$RELEASE_TAG \
--repo-tag=backend:$RELEASE_TAG \
--repo-tag=thirdparty:$RELEASE_TAG \
--backend=ensemble:$RELEASE_TAG \
--backend=tensorrt:$RELEASE_TAG \
--backend=identity:$RELEASE_TAG \
--backend=repeat:$RELEASE_TAG \
--backend=square:$RELEASE_TAG \
--backend=onnxruntime:$RELEASE_TAG \
--backend=pytorch:$RELEASE_TAG \
--backend=python:$RELEASE_TAG \
--repoagent=checksum:$RELEASE_TAG