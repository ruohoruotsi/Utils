#!/bin/bash

echo "directory name: $1";

find $1 -type d -name '_*' -maxdepth 1 -exec sh -c '
for fp; do
  echo mv "$fp" "${fp#*_}"
  mv "$fp" "${fp#*_}"
done' sh {} +
