locals {
  data_lake_bucket = "taxi-rides-ny"
}

variable "project" {
  description = "datatalksclub-data_engineering_zoomcamp"
  default = "taxi-rides-ny1"
  type = string
}

variable "region" {
  description = "Region for GCP resources. Choose as per your location: https://cloud.google.com/about/locations"
  default = "europe-west3"
  type = string
}

variable "storage_class" {
  description = "Storage class type for your bucket. Check official docs for more info."
  default = "STANDARD"
}

variable "bucket_name" {
  description = "The name of the GCS bucket"
  type        = string
  default     = "nytaxi_raw"
}


variable "BQ_DATASET" {
  description = "BigQuery Dataset that raw data (from GCS) will be written to"
  type = string
  default = "nytaxi"
}
variable "credentials" {
  description = "path to credential.json"
  type = string
  default = "/home/david/.google/credentials/google_credentials.json"

}
