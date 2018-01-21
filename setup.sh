#!/bin/bash

# set -e

# configure aws-cli manually
aws configure

# load cluster-config
source config/cluster.env.sh

# create Route53-hosted-zone
aws route53 create-hosted-zone --name ${CLUSTER_DNS_NAME} --caller-reference 1

# create S3-bucket
aws s3 mb s3://${AWS_S3_BUCKET_NAME} 

# create cluster
kops create cluster --zones=${AWS_AVAIL_ZONE} ${CLUSTER_DNS_NAME} 
kops update cluster ${CLUSTER_DNS_NAME} --yes
