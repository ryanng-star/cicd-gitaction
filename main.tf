terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0"
    }
  }
  backend "gcs" {
    bucket  = "ryangitactionbucket"   # <--- Keep the one you made earlier
    prefix  = "terraform/state"
  }
}

provider "google" {
  project = "my-rd-ce-horng-lee"       # <--- Replace this
  region  = "asia-southeast1"
}

# --- THE NEW SIMPLE RESOURCE ---
# This is what Terraform will create automatically
resource "google_storage_bucket" "auto_bucket" {
  name          = "my-github-action-bucket-ryan-123"  # <--- Make this unique!
  location      = "asia-southeast1"
  force_destroy = true
}