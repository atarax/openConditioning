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

### DNS and hosted zone

For kops to function propertly, you have to create a hosted-zone on Route53. You also have to own a domain on which you are able to set you DNS-Nameservers to the ones provided by AWS-Route53. You can see the 4 Nameservers when going clicking on your Route53-entry in the interface.
Run following command to create a hosted, be sure to adjuste the domain-name properly.
 
```aws route53 create-hosted-zone --name your.cluster.domain.com --caller-reference 1```

## Installation

 create aws-hosted 
