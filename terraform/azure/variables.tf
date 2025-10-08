variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "devops-pipeline-demo"
}

variable "location" {
  description = "The Azure region to deploy to"
  type        = string
  default     = "eastus"
}

variable "environment" {
  description = "The environment (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "node_count" {
  description = "Number of nodes in the AKS cluster"
  type        = number
  default     = 2
}

variable "vm_size" {
  description = "VM size for AKS nodes"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "acr_sku" {
  description = "The SKU of the Azure Container Registry"
  type        = string
  default     = "Basic"
}
