# Terraform Google Cloud Example

This repository contains Terraform configuration files to create a simple infrastructure on Google Cloud Platform (GCP) to host a Datapipeline. The infrastructure includes a Google Cloud Storage bucket and a BigQuery dataset, as well as a service account with read access to the BigQuery dataset.



## Prerequisites

- A Google Cloud Platform account with an active project.
- Terraform >= 1.0 installed on your local machine.
- Google Cloud SDK (gcloud) installed and configured on your local machine.
- A Service Account key in JSON format with the necessary permissions to manage resources in the project.

## Installation

1. Clone this repository to your local machine.

2. Set the `GOOGLE_APPLICATION_CREDENTIALS` environment variable to the path of your Service Account key file:

- For Linux or macOS:

  ```sh
  export GOOGLE_APPLICATION_CREDENTIALS="/path/to/your-service-account-key.json"
  ```

- For Windows (PowerShell):

  ```powershell
  $env:GOOGLE_APPLICATION_CREDENTIALS="C:\path\to\your-service-account-key.json"
  ```

  or use the `.env` file to define this environment variable.
  Run:
  ```
  mv .env.example .env
  ```
  and change the path in the file.


3. Initialize the Terraform working directory:
```sh
terraform init
```
4. Update the `variables.tf` file with the appropriate values for your project and desired resource configurations:

```sh
variable "project" {
description = "The ID of the Google Cloud project"
default = "<ID here>"
type = string
}

variable "region" {
description = "The region in which to create the resources"
default = "europe-west3"
type = string
}

variable "bucket_name" {
description = "The name of the Google Cloud Storage bucket"
default = "<bucket name here>"
type = string
}

variable "storage_class" {
description = "The storage class for the Google Cloud Storage bucket"
default = "STANDARD"
type = string
}

variable "BQ_DATASET" {
description = "The ID of the BigQuery dataset"
default = "<name here>"
type = string
}
```

## Usage

1. Run `terraform plan` to see the changes that will be made to your infrastructure.
2. If you're satisfied with the changes, apply them by running `terraform apply`
Confirm the changes by typing `yes` when prompted.

3. To destroy the infrastructure when you no longer need it, run `terraform destroy`
Confirm the destruction by typing `yes` when prompted.

## Contributing

Contributions to this repository are welcome. Please submit a pull request or open an issue with your suggestions or improvements.
