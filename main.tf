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

