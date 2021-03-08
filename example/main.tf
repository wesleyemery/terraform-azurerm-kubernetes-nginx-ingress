module "ngnix_ingress" {
  source = "../"

  helm_release_name = "stable-nginx"
  helm_repository = "nginx-stable"
  helm_chart_version = "0.8.0"
  kubernetes_namespace = "ingress-basic"
  toleration_key = "key1"
  toleration_operator ="Equal"
  toleration_value = "value1"
  toleration_effect = "NoExecute"
}