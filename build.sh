#!/usr/bin/env bash
set -e

docker build -t ghcr.io/netwarlan/garrysmod "$@" .
