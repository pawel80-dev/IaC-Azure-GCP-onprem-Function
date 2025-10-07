# variable "GOOGLE_CREDENTIALS" {
#   description = "GCP credentials"
#   type    = string
#   default = ""
# }

variable "gc_project_id" {
  description = "GC project id"
  type    = string
  default = ""
}

variable "gc_region" {
  description = "Google Cloud region"
  type    = string
  default = ""
}
