## Setup GCP using Terraform

### Concepts
* [Terraform_overview](https://github.com/d-gilles/My-Notebooks/blob/main/Terraform.md)

To setup a cloud environment on GCP for the applying this pipeline in the cloud I use terraform. After creating a service account for this purpose and downloading the credential.json file, I set up some variables in the `variables.tf` file and declare the needed components in `main.tf`.



### Execution

```shell
# Refresh service-account's auth-token for this session
gcloud auth application-default login

# Initialize state file (.tfstate)
terraform init

# Check changes to new infra plan
terraform plan
```

```shell
# Create new infra
terraform apply
```

```shell
# Delete infra after your work, to avoid costs on any running services
terraform destroy
```
