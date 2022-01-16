variable "project_name" {
  type     = string
  description = "Project Name"
}

variable "region" {
  type     = string
  description = "Region"
}

variable "org_id" {
  type     = string
  description = "Organization Name"
}

variable "gcp_service_list" {
  description = "List of GCP service to be enabled for a project."
  type        = list
}