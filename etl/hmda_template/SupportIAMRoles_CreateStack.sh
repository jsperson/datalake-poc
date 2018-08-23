#!/bin/bash
aws cloudformation create-stack --stack-name SupportIAMRoles --template-url https://s3.amazonaws.com/datalake-poc-matt/feeds/hmda/hmda_lar/scripts/deployment/SupportIAMRoles.yaml --capabilities CAPABILITY_NAMED_IAM --profile datalake
