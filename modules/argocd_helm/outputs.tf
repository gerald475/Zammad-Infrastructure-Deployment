output "release_name" {
  description = "Name of the deployed Helm release"
  value       = helm_release.this.name
}

output "chart_version" {
  description = "Installed Helm chart version"
  value       = helm_release.this.version
}
