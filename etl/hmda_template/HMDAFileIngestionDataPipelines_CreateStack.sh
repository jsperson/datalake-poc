#!/bin/bash
aws cloudformation create-stack --stack-name HMDADataIngestionDataPipelines --template-url https://s3.amazonaws.com/datalake-poc-matt/feeds/hmda/hmda_lar/scripts/deployment/HMDAFileIngestionDataPipelines.yaml --parameters file://HMDAFileIngestionDataPipelines_CreateStack_Parameters.json --profile datalake
