# Make sure you have gcloud and terraform on your local/server
# Set config to your GCP Console first hence your gcloud client can access GCP Console and doing some activity. In this case terraform doing it


# Terraform performs require that the API be enabled to do so. In this guide, Terraform requires the following:
gcloud services enable cloudresourcemanager.googleapis.com
gcloud services enable cloudbilling.googleapis.com
gcloud services enable iam.googleapis.com
gcloud services enable compute.googleapis.com
gcloud services enable serviceusage.googleapis.com

# Objective
- Create a Terraform Admin Project for the service account and remote state bucket.
- Grant Organization-level permissions to the service account.

# How to create project from terraform

cd .
terraform init
terraform plan
terraform apply -auto-approve

