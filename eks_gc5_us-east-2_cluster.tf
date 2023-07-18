module "eks_gc5_us-east-2" {
  providers = {
    aws        = aws.eks_gc5_us-east-2
    kubernetes = kubernetes.eks_gc5_us-east-2
  }

  source = "github.com/kbst/terraform-kubestack//aws/cluster?ref=v0.18.2-beta.0"

  configuration = {
    apps = {
      base_domain                = var.base_domain
      cluster_availability_zones = "us-east-2a,us-east-2b,us-east-2c"
      cluster_desired_capacity   = 1
      cluster_instance_type      = "t2.medium"
      cluster_max_size           = 1
      cluster_min_size           = 1
      name_prefix                = "gc5"
    }
    ops = {}
  }
}
