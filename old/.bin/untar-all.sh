#! /usr/bin/env bash
set -e


for i in *.tar*; do
  tar -xvf "$i"
done
