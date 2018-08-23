#!/bin/bash
aws cloudformation create-stack --stack-name SupportLambdaFunctions --template-url https://s3.amazonaws.com/datalake-poc-matt/feeds/hmda/hmda_lar/scripts/deployment/SupportLambdaFunctions.yaml --profile datalake
