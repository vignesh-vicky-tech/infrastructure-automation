terraform {
  backend "s3" {
    bucket = "terraform-state-kubestack-buckets"
    region = "us-east-2"
    key    = "tfstate"
  }
}
