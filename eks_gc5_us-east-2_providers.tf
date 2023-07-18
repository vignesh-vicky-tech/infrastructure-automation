provider "aws" {
  alias = "eks_gc5_us-east-2"

  region = "us-east-2"
}

provider "kustomization" {
  alias = "eks_gc5_us-east-2"

  kubeconfig_raw = module.eks_gc5_us-east-2.kubeconfig
}

locals {
  eks_gc5_us-east-2_kubeconfig = yamldecode(module.eks_gc5_us-east-2.kubeconfig)
}

provider "kubernetes" {
  alias = "eks_gc5_us-east-2"

  host                   = local.eks_gc5_us-east-2_kubeconfig["clusters"][0]["cluster"]["server"]
  cluster_ca_certificate = base64decode(local.eks_gc5_us-east-2_kubeconfig["clusters"][0]["cluster"]["certificate-authority-data"])
  token                  = local.eks_gc5_us-east-2_kubeconfig["users"][0]["user"]["token"]
}
