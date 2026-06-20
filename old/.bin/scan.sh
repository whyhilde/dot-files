#! /usr/bin/env bash
set -e


IP=$1


for PORT in {1..1234}; do
  timeout 1 bash -c "echo > /dev/tcp/$ip/$port" 2>/dev/null &&
  echo "[$IP] port is open: $PORT"
done
