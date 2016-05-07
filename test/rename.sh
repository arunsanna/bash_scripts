#!/bin/bash

for file in *txt
do
    mv -i "${file}" "${file/.txt/.rtf}"
done

#old name to new name