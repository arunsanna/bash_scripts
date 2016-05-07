#!/bin/bash

LISTFILE="./web.lst"

function test {
  response=$(curl --write-out %{http_code} --silent --output /dev/null $1)

  if [ $response -eq 200 ]; then
    echo "$1 site working"
  else
    echo "problem : $1 -- $response ";
  fi
}

while read s; do
  test $s
done < $LISTFILE