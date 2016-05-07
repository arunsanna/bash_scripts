#!/bin/bash
site=$1
if ping -q -c 1 -W 1 $site >/dev/null; then
  echo "google is working"
else
  echo "google is down"
fi