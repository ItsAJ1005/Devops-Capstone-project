output "gke_cluster_name" {
  description = "The name of the GKE cluster"
  value       = google_container_cluster.primary.name
}

output "gke_cluster_endpoint" {
  description = "The endpoint of the GKE cluster"
  value       = google_container_cluster.primary.endpoint
}

output "gke_node_pool_name" {
  description = "The name of the GKE node pool"
  value       = google_container_node_pool.primary_nodes.name
}

output "vpc_name" {
  description = "The name of the VPC"
  value       = google_compute_network.vpc.name
}

output "subnet_name" {
  description = "The name of the subnet"
  value       = google_compute_subnetwork.subnet.name
}

# Output the service account email that was created for GKE
output "gke_service_account_email" {
  description = "The email of the service account created for GKE"
  value       = google_service_account.gke_sa.email
}

# Output the cluster CA certificate (use with caution as it's sensitive)
output "cluster_ca_certificate" {
  description = "Base64 encoded public certificate that is the root of trust for the cluster"
  value       = google_container_cluster.primary.master_auth[0].cluster_ca_certificate
  sensitive   = true
}

# Output the client token (use with caution as it's sensitive)
output "client_token" {
  description = <<EOT
  The client token to authenticate to the GKE cluster.
  This is a sensitive value and should be handled with care.
  EOT
  value       = base64encode(google_container_cluster.primary.master_auth[0].client_certificate)
  sensitive   = true
}
