project_name      = "tf-example"
region            = "asia-southeast1"
org_id            = <Fill with Organization Number ID of Your GCP>

gcp_service_list = [
  "cloudresourcemanager.googleapis.com", # 
  "cloudapis.googleapis.com",            # Google Cloud APIs
  "compute.googleapis.com",              # Compute Engine API
  "iam.googleapis.com",                  # Identity and Access Management (IAM) API
  "monitoring.googleapis.com",           # Stackdriver Monitoring API
  "serviceusage.googleapis.com",         # Google Cloud Storage JSON API
]