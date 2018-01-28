#!/bin/bash

# exit on errors by default
# set -e

# configure aws-cli manually
echo "Please configure aws-cli:"
aws configure

# load cluster-config
source config/cluster.env

# create S3-bucket
echo "Creating S3-bucket with name: ${AWS_S3_BUCKET_NAME}..."
aws s3 mb s3://${AWS_S3_BUCKET_NAME} 

# configure kops 
export KOPS_STATE_STORE=s3://${AWS_S3_BUCKET_NAME}

# create cluster
echo "Creating cluster ${CLUSTER_DNS_NAME} using kops...."
kops create cluster --zones=${AWS_AVAIL_ZONE} ${CLUSTER_DNS_NAME} 
kops update cluster ${CLUSTER_DNS_NAME} --yes
