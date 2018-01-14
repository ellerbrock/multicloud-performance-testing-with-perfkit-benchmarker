#!/usr/bin/env bash

set -e

VERSION="1.13.0"

function main() {
  wget "https://github.com/GoogleCloudPlatform/PerfKitBenchmarker/archive/v${VERSION}.zip"
  unzip "v${VERSION}.zip"
  rm "v${VERSION}.zip"
  cd "PerfKitBenchmarker-${VERSION}"
  pip install --user pipenv
  pipenv install requests
  pipenv install -r requirements.txt
  pipenv install -r perfkitbenchmarker/providers/alicloud/requirements.txt
}

function benchmark() {
  # just an example how to run
  pipenv run python pkb.py \
      --cloud=AliCloud \
      --machine_type=ecs.sn1.medium \
      --zones=eu-central-1a \
      --benchmarks=iperf
}

main

