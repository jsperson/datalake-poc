#!/bin/bash
aws cloudformation create-stack --stack-name SupportSNSTopics --template-url https://s3.amazonaws.com/datalake-poc-matt/feeds/hmda/hmda_lar/scripts/deployment/SupportSNSTopics.yaml --profile datalake
