#!/usr/bin/env bash
echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config &&

$ terraform init -backend-config="bucket=ourteam-terraform-dev" -backend-config="key=anosulchik.tfstate" -backend-config="region=us-east-1" -backend=true -force-copy -get=true -input=false
