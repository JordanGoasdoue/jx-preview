#!/bin/bash

set -e -o pipefail

if [ "$DISABLE_LINTER" == "true" ]
then
  exit 0
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

linterVersion="$(golangci-lint --version | awk '{print $4}')"

if [ "${linterVersion}" != "1.46.2" ]; then
	echo "Install GolangCI-Lint version ${linterVersion}"
  exit 1
fi

export GO111MODULE=on
golangci-lint run \
  --verbose \
  --build-tags build
