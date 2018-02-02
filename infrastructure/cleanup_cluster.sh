#!/bin/bash

# load configuration
source config/cluster.env

# exit on errors by default
set -e

# delete whole cluster
echo "Deleting cluster..."
kops delete cluster ${CLUSTER_DNS_NAME} --yes

# delete s3-bucket
echo "Deleting S3-Bucket..."
aws s3 rb s3://${AWS_S3_BUCKET_NAME} --force


