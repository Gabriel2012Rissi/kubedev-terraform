variable "k8s_cluster_name" {
  description = "Nome padrão do cluster"
  default = "k8s-kubedev"
}

variable "k8s_cluster_version" {
  description = "Versão do cluster"
  default = "1.23.9-do.0"
}

variable "k8s_cluster_region" {
  description = "Região padrão do cluster"
  default = "nyc1"
}

variable "k8s_cluster_node_size" {
  description = "Tipo de droplet que será usado no node pool padrão"
  default = "s-1vcpu-2gb"
}

variable "k8s_cluster_node_count" {
  description = "Quantidade de nodes padrão que será usado no cluster"
  default = 2
}