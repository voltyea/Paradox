#!/bin/bash

while true; do
  for i in "" "." ".." "..."; do
    echo -ne "loading$i   \r"
    sleep 0.5
  done
done

