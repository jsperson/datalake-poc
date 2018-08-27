#!/bin/bash
echo "Uploading files to S3"
./upload_script_files.sh

echo "Deploying SupportIAMRoles"
aws cloudformation create-stack --stack-name SupportIAMRoles --template-url https://s3.amazonaws.com/datalake-poc-matt/feeds/hmda/hmda_lar/scripts/deployment/SupportIAMRoles.yaml --capabilities CAPABILITY_NAMED_IAM --profile datalake
aws cloudformation wait stack-create-complete --stack-name SupportIAMRoles --profile datalake
if test "$?" != "0"
then
    echo "SupportIAMRoles Did Not Return in a Timely Manner"
    exit $?
fi

echo "Deploying SupportLambdaFunctions"
aws cloudformation create-stack --stack-name SupportLambdaFunctions --template-url https://s3.amazonaws.com/datalake-poc-matt/feeds/hmda/hmda_lar/scripts/deployment/SupportLambdaFunctions.yaml --profile datalake
aws cloudformation wait stack-create-complete --stack-name SupportLambdaFunctions --profile datalake
if test "$?" != "0"
then
    echo "SupportLambdaFunctions Did Not Return in a Timely Manner"
    exit $?
fi

echo "Deploying SupportSNSTopics"
aws cloudformation create-stack --stack-name SupportSNSTopics --template-url https://s3.amazonaws.com/datalake-poc-matt/feeds/hmda/hmda_lar/scripts/deployment/SupportSNSTopics.yaml --profile datalake
aws cloudformation wait stack-create-complete --stack-name SupportSNSTopics --profile datalake
if test "$?" != "0"
then
    echo "SupportSNSTopics Did Not Return in a Timely Manner"
    exit $?
fi

echo "Deploying HMDADataIngestionDataPipelines"
aws cloudformation create-stack --stack-name HMDADataIngestionDataPipelines --template-url https://s3.amazonaws.com/datalake-poc-matt/feeds/hmda/hmda_lar/scripts/deployment/HMDAFileIngestionDataPipelines.yaml --parameters file://HMDAFileIngestionDataPipelines_CreateStack_Parameters.json --profile datalake
aws cloudformation wait stack-create-complete --stack-name HMDADataIngestionDataPipelines --profile datalake
if test "$?" != "0"
then
    echo "SupportSNSTopics Did Not Return in a Timely Manner"
    exit $?
fi

echo "Everything Successful"
echo "Don't forget to add an email address to the SNS topic using the following command: aws sns subscribe --topic-arn <topicarn> --protocol email --notification-endpoint <email_address>"
