resource "helm_release" "nginx_ingress" {
  name       = var.helm_release_name
  repository =
  chart      = "ingress-nginx"
  version    = var.helm_chart_version
  namespace  = var.kubernetes_namespace

  create_namespace = var.kubernetes_create_namespace


  set {
    name  = "controller.nodeSelector.'beta\\.kubernetes\\.io/os'"
    value = "linux"
  }

  set {
    name  = "defaultBackend.nodeSelector.'beta\\.kubernetes\\.io/os'"
    value = "linux"
  }


  set {
    name  = "controller.service.annotations"
    value = "service.beta.kubernetes.io/azure-load-balancer-internal: \"true\""
  }


  values = [
    templatefile("${path.module}/config/nginx_ingress_config.yaml.tmpl", {
      ingress_class      = var.ingress_class
      replica_count      = var.replica_count
     // ip_address         = var.load_balancer_ip
      enable_default_tls = var.enable_default_tls
      default_tls_secret = var.tls_default_secret
      toleration_key     = var.toleration_key
      toleration_value   = var.toleration_value
      toleration_operator = var.toleration_operator
      toleration_effect   = var.toleration_effect

    }),
    var.additional_yaml_config
  ]
}
