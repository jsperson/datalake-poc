#!/bin/sh
aws emr create-cluster --kerberos-attributes '{"CrossRealmTrustPrincipalPassword":"","ADDomainJoinUser":"","KdcAdminPassword":"","Realm":"EC2.INTERNAL","ADDomainJoinPassword":""}' \
--applications Name=Hadoop Name=Hive Name=Pig Name=Hue Name=Presto \
--ec2-attributes '{"KeyName":"FDICKeyPair","InstanceProfile":"EMR_EC2_DefaultRole","SubnetId":"subnet-61f8652b","EmrManagedSlaveSecurityGroup":"sg-a6133aee","EmrManagedMasterSecurityGroup":"sg-a6133aee"}' \
--release-label emr-5.13.0 \
--log-uri 's3n://aws-logs-019672110497-us-east-1/elasticmapreduce/' \
--instance-groups '[{"InstanceCount":2,"EbsConfiguration":{"EbsBlockDeviceConfigs":[{"VolumeSpecification":{"SizeInGB":32,"VolumeType":"gp2"},"VolumesPerInstance":1}]},"InstanceGroupType":"CORE","InstanceType":"m4.large","Name":"Core - 2"},{"InstanceCount":1,"EbsConfiguration":{"EbsBlockDeviceConfigs":[{"VolumeSpecification":{"SizeInGB":32,"VolumeType":"gp2"},"VolumesPerInstance":1}]},"InstanceGroupType":"MASTER","InstanceType":"m4.large","Name":"Master - 1"}]' \
--auto-scaling-role EMR_AutoScaling_DefaultRole \
--ebs-root-volume-size 10 \
--service-role EMR_DefaultRole \
--security-configuration 'EMR Cluster Security Configuration' \
--enable-debugging \
--name 'EMR Cluster' \
--scale-down-behavior TERMINATE_AT_TASK_COMPLETION \
--region us-east-1