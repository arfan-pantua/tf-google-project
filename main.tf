provider "google" {
  region = var.region
}

data "google_billing_account" "acct" {
  display_name = "Billing Account"
  open         = true
}

data "google_iam_policy" "admin" {
  binding {
    role = "roles/editor"

    members = [
      # User member who are created on GCP Console
      "user:arfan-pantua@example.com"
    ]
  }
}

resource "random_id" "id" {
  byte_length = 4
  prefix      = var.project_name
}

resource "google_project" "project" {
  name            = var.project_name
  project_id      = "${var.project_name}-${random_id.id.hex}"
  org_id          = var.org_id
  billing_account = data.google_billing_account.acct.id
}


resource "google_service_account_iam_policy" "admin-account-iam" {
  service_account_id = google_service_account.sa.name
  policy_data        = data.google_iam_policy.admin.policy_data
}

resource "google_service_account" "sa" {
  account_id   = "terraform"
  project      = google_project.project.project_id
  display_name = "A service account that only Arfan Pantua can access"
}

resource "google_service_account_key" "cred" {
  service_account_id = google_service_account.sa.name
  public_key_type    = "TYPE_X509_PEM_FILE"
}

resource "local_file" "key" {
  filename = "./../account-key/${var.project_name}.json"
  content  = "${base64decode(google_service_account_key.cred.private_key)}"
}

# Enable services in newly created GCP Project.
resource "google_project_service" "gcp_services" {
  count   = length(var.gcp_service_list)
  project = google_project.project.project_id
  service = var.gcp_service_list[count.index]

  disable_dependent_services = true
}

output "project_id" {
  value = google_project.project.project_id
}
