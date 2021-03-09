provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

module "ngnix_ingress" {
  source = "../"

  helm_release_name = "stable-nginx"
  helm_chart = "nginx-stable"
  helm_chart_version = var.helm_chart_version
  kubernetes_namespace = "ingress-basic"
  toleration_key = "key1"
  toleration_operator ="Equal"
  toleration_value = "value1"
  toleration_effect = "NoExecute"
}