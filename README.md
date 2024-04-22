# Azure Infrastructure Creation using Terraform By Raghu The Security Expert

Helpful Terraform Links:
- [Terraform Language Documentation](https://www.terraform.io/docs/language/index.html)
- [Resource: azure_registry](https://registry.terraform.io/namespaces/Azure)

## Step 0: Initialize Terraform
```
terraform init
```

## Step 1: Plan Resources
```
terraform plan -var-file="vars/east-us-2.tfvars"
```

## Step 2: Apply Resources
```
terraform apply -var-file="vars/east-us-2.tfvars"
```

## Step 3: Cleanup Terraform Resources
```
terraform destroy -var-file="vars/east-us-2.tfvars"
