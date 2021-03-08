variable "helm_repository" {
  description = "nginx-ingress helm repository url"
  type        = string
  default     = "https://kubernetes.github.io/ingress-nginx"
}

variable "helm_chart_version" {
  description = "helm chart version"
  type        = string
  default     = "3.4.1"
}

variable "helm_release_name" {
  description = "helm release name"
  type        = string
}

variable "kubernetes_namespace" {
  description = "kubernetes_namespace"
  type        = string
  default     = "default"
}

variable "kubernetes_create_namespace" {
  description = "create kubernetes namespace"
  type        = bool
  default     = true
}

variable "ingress_class" {
  description = "name of the ingress class to route through this controller"
  type        = string
  default     = "nginx"
}

/*
variable "load_balancer_ip" {
  description = "loadBalancerIP"
  type        = string
}
*/

variable "replica_count" {
  description = "The number of replicas of the Ingress controller deployment."	
  type        = number
  default     = 1
}

variable "enable_default_tls" {
  description = "enable default tls (requires tls_default_secret)"
  type        = bool
  default     = false
}

variable "tls_default_secret" {
  description = "k8s secret containing crt/key for default tls certificate (format is {namespace}/{secret})"
  type        = string
  default     = ""
}


variable "toleration_key" {
  type = string
  description = "Key for Toleration applied to pods, and allow (but do not require) the pods to schedule onto nodes with matching taints"
  default = ""
}

variable "toleration_value" {
  type = string
  description = "Value for Toleration  applied to pods, and allow (but do not require) the pods to schedule onto nodes with matching taints"
  default = ""
}

variable "toleration_operator" {
  type = string
  description = "Operator for Toleration applied to pods, and allow (but do not require) the pods to schedule onto nodes with matching taints"
  default = ""
}

variable "toleration_effect" {
  type = string
  description = "Effect for Toleration applied to pods, and allow (but do not require) the pods to schedule onto nodes with matching taints"
  default = ""
}


/*variable "pod_tolerations" {
  type = list(object({
    key      = string
    operator =  string
    value    = string
    effect   = string
  }))
}*/

variable "additional_yaml_config" {
  description = "yaml config for helm chart to be processed last"
  type        = string
  default     = ""
}

