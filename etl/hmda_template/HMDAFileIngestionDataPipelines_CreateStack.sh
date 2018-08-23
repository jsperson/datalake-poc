#!/bin/bash
aws cloudformation create-stack --stack-name HMDADataIngestionDataPipelines --template-url https://s3.amazonaws.com/datalake-poc-matt/feeds/hmda/hmda_lar/scripts/deployment/HMDAFileIngestionDataPipelines.yaml --parameters file:///Users/mattroberts/Documents/GitHub/datalake-poc/etl/hmda_template/HMDAFileIngestionDataPipelines_CreateStack_Parameters.json --profile datalake
