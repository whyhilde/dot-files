#! /usr/bin/env bash
set -e


for i in *.zip; do
  unzip "$i"
done
