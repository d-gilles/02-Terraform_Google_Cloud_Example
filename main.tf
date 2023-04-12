terraform {
  required_version = ">= 1.0"
  backend "local" {}  # Can change from "local" to "gcs" (for google) or "s3" (for aws), if you would like to preserve your tf-state online
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
  }
}

provider "google" {
  project = var.project
  region = var.region
  #credentials = var.credentials
}

# Data Lake Bucket
# Ref: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket

resource "google_storage_bucket" "data-lake-bucket" {
  name          = var.bucket_name
  location      = var.region
  storage_class = var.storage_class
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 30
    }
  }

  force_destroy = true
}

# DWH
# Ref: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset
resource "google_bigquery_dataset" "dataset" {
  dataset_id = var.BQ_DATASET
  project    = var.project
  location   = var.region
}

# BigQuery Reader Service Account
# Ref: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account
resource "google_service_account" "bigquery_reader" {
  account_id   = "bigquery-reader-sa"
  display_name = "BigQuery Reader Service Account"
}

# BigQuery Data Viewer IAM role for the service account
# Ref: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam
resource "google_project_iam_member" "bigquery_data_viewer" {
  project = var.project
  role    = "roles/bigquery.dataViewer"
  member  = "serviceAccount:${google_service_account.bigquery_reader.email}"
}
