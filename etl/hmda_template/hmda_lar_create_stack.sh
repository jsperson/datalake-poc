#!/bin/bash
aws cloudformation create-stack --stack-name HMDALARDataIngestionDataPipelines --template-url https://s3.amazonaws.com/datalake-poc-matt/feeds/hmda/hmda_lar/scripts/deployment/hmda_lar_create_stack.yaml --parameters file://hmda_lar_create_stack_parameters.json --profile datalake
