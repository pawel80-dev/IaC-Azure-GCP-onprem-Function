# https://cloud.google.com/run/docs/functions/comparison

resource "random_id" "default" {
  byte_length = 8
}

resource "google_storage_bucket" "bucket" {
  name                        = "${random_id.default.hex}-gcf-source" # Every bucket name must be globally unique
  location                    = var.gc_region
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_object" "object" {
  name   = "function-source.zip"
  bucket = google_storage_bucket.bucket.name
  source = "function-source.zip"  # Add path to the zipped function source code
}

resource "google_cloudfunctions2_function" "function" {
  name        = "function-v2"
  location    = var.gc_region
  description = "a new function"

  build_config {
    runtime   = "nodejs20"
    entry_point = "helloHttp"  # Set the entry point 
    source {
      storage_source {
        bucket = google_storage_bucket.bucket.name
        object = google_storage_bucket_object.object.name
      }
    }
  }

  service_config {
    max_instance_count  = 1
    available_memory    = "256M"
    timeout_seconds     = 60
  }
}
