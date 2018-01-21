# openConditioning

## Prequisites

- having an AWS-account
- having an AWS-api-token with proper rights
- aws-cli is installed
- kubectl is installed
- kops is installed

## Preparations

### Configure AWS-cli

Run following command and enter values prompted for

```aws configure```

You can also work with configuration-files in your home-folder. Check aws-cli-documentation for that.

### DNS and hosted zone

For kops to function propertly, you have to create a hosted-zone on Route53. You also have to own a domain on which you are able to set you DNS-Nameservers to the ones provided by AWS-Route53. You can see the 4 Nameservers when going clicking on your Route53-entry in the interface.
Run following command to create a hosted, be sure to adjuste the domain-name properly.
 
```aws route53 create-hosted-zone --name your.cluster.domain --caller-reference 1```

### S3 Bucket

Kops prefered way of storing it's cluster-configuration is a S3-bucket. It can and should be used to maintain multiple clusters. Create it with the following command (choose your bucket-name wisely):

```aws s3 mb s3://your.s3.bucket.name```

After that, you can set the cops-state-source to this bucket:

```export KOPS_STATE_STORE=s3://your.s3.bucket.name```

### Creating the cluster

Now you can finally create your cluster. The first command will show you what will be created, the second will commit to the cloud. Be sure to double-check everything before running the update-command! As always, be sure to adjust values properly.
It will take a few mins until yout cluster is ready.

```
kops create cluster --zones=your-aws-zone your.cluster.domain
kops update cluster your.cluster.domain --yes
```

You can check if your cluster is ready by issuing:

```kops validate cluster```

### Editing the cluster

Editing the cluster is out of the scope here, check kops-documentation.

### Configure kubectl to use cluster

You should now configure kubectl to use your freshly created cluster:

```kubectl config set-cluster your.cluster.domain```

### Credentials for your cluster-api

Can be obtained with

```kubectl config view```

### UI-Dashboard, fun++

Install the kubernetes-dashboard-ui with following command:

```kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml```

#### Authenticating UI

You can authenticate the ui against the api with for example using a token, which you can obtain by

```kubectl -n kube-system get secret```

which gives you a list of tokens. You can use the deployment-token for example:

```kubectl -n kube-system describe secret deployment-controller-token-SOMEHASH```

### Cleanup

You can cleanup and destroy the cluster with:

```kops delete cluster your.cluster.domain --yes```

## Installation

tbd
