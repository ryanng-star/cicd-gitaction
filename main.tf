terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0"
    }
  }
  backend "gcs" {
    bucket  = "ryangitactionbucket"   # <<<< REPLACE THIS (created in Step 1)
    prefix  = "terraform/state"
  }
}

provider "google" {
  project = "my-rd-ce-horng-lee"      # <<<< REPLACE THIS (from Google Cloud)
  region  = "asia-southeast1"
}

variable "docker_image" {
  type = string
}

resource "google_cloud_run_service" "default" {
  name     = "my-automated-service"
  location = "asia-southeast1"

  template {
    spec {
      containers {
        image = var.docker_image
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

# This makes the URL public so you can click it
resource "google_cloud_run_service_iam_member" "public_access" {
  service  = google_cloud_run_service.default.name
  location = google_cloud_run_service.default.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}

output "url" {
  value = google_cloud_run_service.default.status[0].url
}