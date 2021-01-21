# Amazing Storm - Terraform

This folder contains all the Infrastructure as a Code configuration and
description files. To this date, the infrastructure is hosted on AWS.

## Terraform

### Useful links

https://medium.com/@dav009/terraform-sane-practices-project-structure-c4347c1bc0f1
https://austincloud.guru/2018/12/how-i-structure-terraform-projects/

### Installation

Download binary
https://www.terraform.io/downloads.html

Export binary to executable
```bash
unzip <terraform zip archive>
sudo mv terraform /usr/local/bin/
```

## Project

List of AWS resources created :
- IAM policy, role, group, user
- S3 buckets, policy
- VPC, security group, subnet, route table, ACL
- Redshift cluster, database, master user
- KMS key

### Project architecture
- **terraform** : root directory
  - **config** : configuration and variables for each environment
  - **modules** : aws resources to be created
  - **prerequisites** : prerequisites to be executed before launching the project
  - *main.tf* : project entry point

### Requirements
##### AWS requirements
To launch the project, you need to set up AWS credentials (2 options):

*Option 1.* use environment variables `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
```sh
export AWS_ACCESS_KEY_ID=myAccessKey
export AWS_SECRET_ACCESS_KEY=mySecretKey
```

*Option 2.* use AWS credentials file in `~/.aws/credentials` by [installing AWS CLI](https://docs.aws.amazon.com/fr_fr/cli/latest/userguide/cli-chap-install.html) and run `aws configure`

### Requirements

#### Launch AWS Environment
```sh
ENV=production
terraform init -reconfigure -backend-config=config/$ENV/$ENV.tfbackend
terraform apply -var-file=config/$ENV/$ENV.tfvars
```
