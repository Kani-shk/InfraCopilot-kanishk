# Terraform Module – EC2 Instance Provisioning

This module provisions a basic Amazon EC2 instance to act as the control node for the InfraCopilot DevSecOps platform.

## ✅ Features
- Deploys an EC2 instance using Amazon Linux 2
- Configurable instance type (`t2.micro` by default)
- Tags the instance as `infracopilot-dev`

## 📁 Files
- `main.tf`: EC2 instance definition
- `variables.tf`: Input variables
- `provider.tf`: AWS provider setup
- `outputs.tf`: Output instance ID

## 🚀 Usage
```bash
terraform init
terraform validate
terraform plan
terraform apply
```
- Requires aws credentials for "aws configure"
