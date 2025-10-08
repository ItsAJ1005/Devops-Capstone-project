variable "project_id" {
  description = "The GCP project ID"
  type        = string
  default     = "your-gcp-project-id"
}

variable "region" {
  description = "The GCP region to deploy to"
  type        = string
  default     = "us-central1"
}

variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "devops-pipeline-demo"
}

variable "node_count" {
  description = "Number of nodes in the GKE cluster"
  type        = number
  default     = 2
}

variable "machine_type" {
  description = "Machine type for GKE nodes"
  type        = string
  default     = "e2-medium"
}
